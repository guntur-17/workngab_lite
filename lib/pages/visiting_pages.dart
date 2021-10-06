import 'dart:io';

import 'package:absen_lite/pages/qr_scan_pages.dart';
import 'package:absen_lite/pages/stock_list_pages.dart';
import 'package:flutter/material.dart';
import 'package:absen_lite/theme.dart';
import 'package:absen_lite/widgets/shop_card.dart';
import 'package:relative_scale/relative_scale.dart';

class VisitingPage extends StatelessWidget {
  // const VisitingPage({Key? key}) : super(key: key);

  static const String _title = 'Visiting';
  String? _result;
  @override
  Widget build(BuildContext context) {
    Widget day() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '07:30',
                  style: trueBlackTextStyle.copyWith(
                      fontSize: 28, fontWeight: semiBold),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  'Senin, 12 Maret 2021',
                  style:
                      greyTextStyle.copyWith(fontSize: 18, fontWeight: reguler),
                )
              ],
            ),
          ),
        ),
      );
    }

    Future _openScanner(BuildContext context) async {
      final result = await Navigator.push(
          context, MaterialPageRoute(builder: (c) => Scanner()));
      _result = result;
    }

    Widget tap() {
      return InkWell(
        onTap: () {
          _openScanner(context);
        },
        child: Container(
          margin: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/scan.png',
                  width: 160,
                  height: 160,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget location() {
      return Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 27),
              width: MediaQuery.of(context).size.width * 0.6,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: lightgreyColor),
              //isi dari kotak berupa location
              child: Column(),
            ),
          ),
        ],
      );
    }

    Widget history() {
      return Container(
        width: MediaQuery.of(context).size.width * 0.91,
        margin: EdgeInsets.only(top: 40, bottom: 10, left: 20, right: 20),
        // height: 195,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('History',
                    style: trueBlackTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w600)),
              ],
            ),
            Divider(
              thickness: 1,
              height: 20,
            ),
            ShopCard()
          ],
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
            title: Text(
              'Visiting',
              style: TextStyle(color: Colors.black),
            ),
            actions: <Widget>[
              Container(
                child: Image(image: AssetImage('assets/rounded.png')),
              ),
            ],
          ),
        ),
        backgroundColor: whiteColor,
        body: Column(
          children: [day(), tap(), location(), history()],
        ),
      ),
    );
  }
}
