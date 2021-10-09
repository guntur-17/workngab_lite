import 'package:absen_lite/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:absen_lite/theme.dart';
import 'package:absen_lite/widgets/shop_card.dart';
import 'package:relative_scale/relative_scale.dart';

class StockListPage extends StatelessWidget {
  const StockListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  'Toko Super Murah',
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
              'Jl. Dr. Setiabudi No.42 - 46, Hegarmanah, Kec. Cidadap, Kota Bandung, Jawa Barat 401412',
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
            ],
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
    );
  }
}
