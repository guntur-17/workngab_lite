import 'dart:async';

import 'package:absen_lite/models/shop_model.dart';
import 'package:absen_lite/pages/camera_pages.dart';

import 'package:absen_lite/services/shop_service.dart';
import 'package:absen_lite/theme.dart';
import 'package:absen_lite/widgets/search_widget.dart';

import 'package:flutter/material.dart';

import 'package:relative_scale/relative_scale.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopListPage extends StatefulWidget {
  final String? addressUser;

  const ShopListPage(this.addressUser, {Key? key}) : super(key: key);

  @override
  _ShopListPageState createState() => _ShopListPageState();
}

class _ShopListPageState extends State<ShopListPage> {
  List<ShopModel> shops = [];
  String query = '';
  Timer? debouncer;

  // bool isLoading = false;
  @override
  void initState() {
    // shopListHandler();
    super.initState();
    shopListHandler();
    init();
  }

  Future shopListHandler() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    shops = await ShopService().getShops(token: token, query: query);
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
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
    Widget card() {
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width * 0.90,
              child: ListView.builder(
                itemCount: shops.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final shop = shops[index];

                  return cardShop(shop: shop);
                },
              ),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
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
            iconTheme: const IconThemeData(color: Colors.black),
            centerTitle: true,
            backgroundColor: Colors.white,
            bottomOpacity: 0.0,
            elevation: 0.0,
            title: Text(
              'Shop',
              style: trueBlackTextStyle.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildSearch(),
              // isLoading ? const LoadingDefault() :
              card(),
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
              margin: const EdgeInsets.only(bottom: 15),
              width: MediaQuery.of(context).size.width - 60,
              height: sy(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/toko.png',
                    width: sy(40),
                    height: sy(40),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              shop!.name,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: trueBlackTextStyle.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      )
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
