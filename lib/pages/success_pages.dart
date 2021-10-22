import 'package:absen_lite/models/shop_model.dart';
import 'package:absen_lite/theme.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class SuccessPages extends StatelessWidget {
  // const SuccessPages({Key? key}) : super(key: key);
  // final ShopModel shop;
  // SuccessPages(this.shop);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return RelativeBuilder(builder: (context, height, width, sy, sx) {
        return Container(
          margin: EdgeInsets.only(top: sy(150)),
          child: Text(
            'Visiting Success',
            style: trueBlackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
          ),
        );
      });
    }

    Widget subtitle() {
      return RelativeBuilder(builder: (context, height, width, sy, sx) {
        return Container(
          child: Text(
            'You have successfully made\nattendance visit',
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: reguler),
            textAlign: TextAlign.center,
          ),
        );
      });
    }

    Widget time() {
      return RelativeBuilder(builder: (context, height, width, sy, sx) {
        return Container(
          margin: EdgeInsets.only(top: sy(10)),
          child: Column(
            children: [
              Text(
                'Time',
                style:
                    blackTextStyle.copyWith(fontSize: 18, fontWeight: reguler),
              ),
              Text(
                '09:00',
                style:
                    trueBlackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
              )
            ],
          ),
        );
      });
    }

    Widget shop() {
      return RelativeBuilder(builder: (context, height, width, sy, sx) {
        return Container(
          margin: EdgeInsets.only(top: sy(25)),
          width: MediaQuery.of(context).size.width - 130,
          height: sy(60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/toko.png',
                    width: sx(80),
                    height: sy(80),
                  ),
                  SizedBox(
                    width: sx(16),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Toko Super Murah',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: trueBlackTextStyle.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '12 September 2021',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: trueBlackTextStyle.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      });
    }

    Widget button() {
      return RelativeBuilder(builder: (context, height, width, sy, sx) {
        return Container(
          margin: EdgeInsets.only(top: sy(8)),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: blueColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Kembali ke Menu Utama',
                style:
                    whiteTextStyle.copyWith(fontSize: 14, fontWeight: reguler),
              ),
              Image.asset(
                'assets/kanan.png',
                width: sx(20),
                height: sy(20),
              ),
            ],
          ),
        );
      });
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/successScan.png'),
                  fit: BoxFit.fill)),
          child: Column(
            children: [title(), subtitle(), time(), shop(), button()],
          ),
        ),
      ),
    );
  }
}
