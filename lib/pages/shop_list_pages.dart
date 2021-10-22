import 'package:absen_lite/providers/shop_provider.dart';
import 'package:absen_lite/theme.dart';
import 'package:absen_lite/widgets/loading_button.dart';
import 'package:absen_lite/widgets/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopListPage extends StatefulWidget {
  // const ShopListPage({Key? key}) : super(key: key);
  double? lat;
  double? long;
  String? addressUser;

  ShopListPage(this.lat, this.long, this.addressUser);

  @override
  _ShopListPageState createState() => _ShopListPageState();
}

class _ShopListPageState extends State<ShopListPage> {
  bool isLoading = false;
  void initState() {
    shopListHandler();
    super.initState();
  }

  shopListHandler() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    // await AttedanceProvider().getAttendances(token);
    await ShopProvider().getShops(token);
    setState(() {
      isLoading = false;
    });

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => AttendanceHistoryPage()),
    // );
  }

  @override
  Widget build(BuildContext context) {
    ShopProvider shopProvider = Provider.of<ShopProvider>(context);
    Widget card() {
      return Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          margin: EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                width: MediaQuery.of(context).size.width * 0.90,
                child: Column(
                  children: shopProvider.shops
                      .map((shop) => ShopCard(
                          shop, widget.lat, widget.long, widget.addressUser))
                      .toList(),
                  // children: visitingAllProvider.showAll
                  //     .map((visiting) => VisitingCard(visiting))
                  //     .toList(),
                ),
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
              'Shop',
              style: trueBlackTextStyle.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                isLoading ? LoadingDefault() : card(),
                // card(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
