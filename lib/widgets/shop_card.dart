import 'package:absen_lite/models/shop_model.dart';
import 'package:absen_lite/pages/camera_pages.dart';
import 'package:absen_lite/pages/test_pages.dart';
import 'package:absen_lite/theme.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class ShopCard extends StatelessWidget {
  // const ShopCard({Key? key}) : super(key: key);

  // final VisistingAllModel visiting;
  // VisitingCard(this.visiting);
  final ShopModel shop;
  // double? latUser;
  // double? longUser;
  String? addressUser;
  ShopCard(this.shop, this.addressUser);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    CameraPages(shop.id, shop.name, addressUser),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 15),
            width: MediaQuery.of(context).size.width - 30,
            height: sy(40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/toko.png',
                      width: sy(20),
                      height: sy(20),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Container(
                            child: Text(
                              '${shop.name}',
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.center,
                              style: trueBlackTextStyle.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Image.asset(
                //   'assets/rightButton.png',
                //   width: sx(20),
                //   height: sx(20),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
