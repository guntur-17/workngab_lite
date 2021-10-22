import 'dart:async';

import 'package:absen_lite/models/shop_model.dart';
import 'package:absen_lite/pages/camera_pages.dart';
// import 'package:absen_lite/pages/search_list_pages.dart';
import 'package:absen_lite/providers/auth_provider.dart';
import 'package:absen_lite/providers/shop_provider.dart';
import 'package:absen_lite/services/shop_service.dart';
import 'package:absen_lite/theme.dart';
import 'package:absen_lite/widgets/loading_button.dart';
import 'package:absen_lite/widgets/search_widget.dart';
import 'package:absen_lite/widgets/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopListPage extends StatefulWidget {
  // const ShopListPage({Key? key}) : super(key: key);

  String? addressUser;

  ShopListPage(this.addressUser);

  @override
  _ShopListPageState createState() => _ShopListPageState();
}

class _ShopListPageState extends State<ShopListPage> {
  // ShopService _shopList = ShopService();
  List<ShopModel> shops = [];
  String query = '';
  Timer? debouncer;

  bool isLoading = false;
  @override
  void initState() {
    shopListHandler();
    super.initState();

    init();
  }

  shopListHandler() async {
    // if (!mounted) return;
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    // await AttedanceProvider().getAttendances(token);
    await ShopProvider().getShops(token);
    if (!mounted) return;
    setState(() {
      isLoading = false;
    });

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => AttendanceHistoryPage()),
    // );
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 250),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    final shops = await ShopService().getShops(token: token, query: query);

    if (!mounted) return;
    setState(() => this.shops = shops);
  }

  @override
  Widget build(BuildContext context) {
    // ShopProvider shopProvider = Provider.of<ShopProvider>(context);
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);

    Widget card() {
      return Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          // margin: EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                width: MediaQuery.of(context).size.width * 0.90,
                child:
                    // FutureBuilder<List<ShopModel>>(
                    //     future: _shopList.getShops(
                    //         token: authProvider.user.access_token),
                    //     builder: (context, snapshot) {
                    //       return
                    ListView.builder(
                  itemCount: shops.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final shop = shops[index];

                    return cardShop(shop: shop);
                  },
                ),
                // }),
              ),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            toolbarHeight: 120,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: trueBlack,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
            backgroundColor: Colors.white,
            bottomOpacity: 0.0,
            elevation: 0.0,
            title: new Text(
              'TShop',
              style: trueBlackTextStyle.copyWith(fontWeight: FontWeight.w600),
            ),
            // actions: [
            //   IconButton(
            //     onPressed: () {
            //       showSearch(context: context, delegate: SearchShopList());
            //     },
            //     icon: Icon(Icons.search),
            //   )
            // ],
          ),
        ),
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildSearch(),
              isLoading ? const LoadingDefault() : card(),
              // card(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Shop name',
        onChanged: searchShop,
      );

  Future searchShop(String query) async => debounce(() async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var token = prefs.getString('token');
        final shops = await ShopService().getShops(token: token, query: query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.shops = shops;
        });
      });

  Widget cardShop({ShopModel? shop}) => RelativeBuilder(
        builder: (context, height, width, sy, sx) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CameraPages(shop!.id, shop.name, widget.addressUser),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 15),
              width: MediaQuery.of(context).size.width - 60,
              height: sy(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/toko.png',
                        width: sy(40),
                        height: sy(40),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            shop!.name,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: trueBlackTextStyle.copyWith(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/rightButton.png',
                    width: sx(20),
                    height: sx(20),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
