import 'package:absen_lite/models/scanner_model.dart';
import 'package:absen_lite/providers/product_provider.dart';
import 'package:absen_lite/providers/scanner_provider.dart';
import 'package:absen_lite/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:absen_lite/theme.dart';
import 'package:absen_lite/widgets/shop_card.dart';
import 'package:provider/provider.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StockListPage extends StatefulWidget {
  double? lat;
  double? long;
  int? id;

  StockListPage(this.lat, this.long, this.id);

  @override
  State<StockListPage> createState() => _StockListPageState();
}

class _StockListPageState extends State<StockListPage> {
  void initState() {
    ProductHandler();
    super.initState();
  }

  ProductHandler() async {
    print(widget.id);
    // setState(() {
    //   isLoading = true;
    // });
    // print(ScannerProvider().data.id);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (await Provider.of<ProductProvider>(context, listen: false)
        .getProduct(widget.id, token)) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ScannerProvider scannerProvider = Provider.of<ScannerProvider>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    double? latShop = widget.lat;
    double? longShop = widget.long;
    ScannerModel shop = scannerProvider.data;
    String? nama = shop.name;
    String? alamat = shop.address;
    Widget detail_shop() {
      return Container(
        margin: EdgeInsets.only(left: 4, top: 29),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/market_stocklist.png',
                  width: 53,
                ),
                SizedBox(
                  width: 17,
                ),
                Text(
                  '$nama',
                  style: trueBlackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '$alamat',
              style: trueBlackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            )
          ],
        ),
      );
    }

    Widget line() {
      return Container(
        margin: EdgeInsets.only(top: 15, bottom: 15),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Image.asset('assets/line.png'),
      );
    }

    Widget stock_list() {
      return Container(
        width: double.infinity,
        // decoration: BoxDecoration(color: blackColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Stock List',
              style: trueBlackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: medium,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              'Please update the rest of your item list',
              style: trueBlackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
              textAlign: TextAlign.start,
            ),
            Column(
              children: productProvider.showProduct
                  .map((products) => ItemCard(products))
                  .toList(),
            )
          ],
        ),
      );
    }

    Widget body() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            children: [
              detail_shop(),
              line(),
              stock_list(),
              // SingleChildScrollView(
              //   child: Column(
              //     children: [

              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: SafeArea(
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
              backgroundColor: blueBlurColor,
              bottomOpacity: 0.0,
              elevation: 0.0,
              title: new Text(
                'Stock List',
                style: trueBlackTextStyle.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          backgroundColor: blueBlurColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              body(),
            ],
          ),
        ),
      ),
    );
  }
}
