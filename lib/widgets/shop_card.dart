import 'package:absen_lite/models/shop_model.dart';
import 'package:absen_lite/pages/camera_pages.dart';

import 'package:absen_lite/theme.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class ShopCard extends StatelessWidget {
  final ShopModel shop;

  final String? addressUser;
  const ShopCard(this.shop, this.addressUser, {Key? key}) : super(key: key);

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
            margin: const EdgeInsets.only(bottom: 15),
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
                    const SizedBox(
                      width: 7,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          shop.name,
                          textAlign: TextAlign.center,
                          style: trueBlackTextStyle.copyWith(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
