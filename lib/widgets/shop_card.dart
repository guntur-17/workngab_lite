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
  ShopCard(this.shop);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CameraPages(shop.id, shop.name),
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
                          '${shop.name}',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: trueBlackTextStyle.copyWith(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
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
}
