import 'package:absen_lite/models/shop_model.dart';
import 'package:absen_lite/models/visiting_all_model.dart';
import 'package:absen_lite/theme.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class VisitingCard extends StatelessWidget {
  // const ShopCard({Key? key}) : super(key: key);

  final VisistingAllModel visiting;
  VisitingCard(this.visiting);

  // final ShopModel shop;
  // ShopCard(this.shop)
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return TextButton(
          style: TextButton.styleFrom(alignment: Alignment.centerRight),
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: Center(
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/toko.png',
                              width: sx(60), height: sx(60)),
                          SizedBox(
                            width: 6,
                          ),
                          Expanded(
                            child: Text('${visiting.shop_name}',
                                overflow: TextOverflow.ellipsis,
                                style: trueBlackTextStyle.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Row(
                        children: [
                          Image.asset('assets/mappin.png',
                              height: sx(12), width: sx(12)),
                          SizedBox(
                            width: 3,
                          ),
                          Text('Alamat',
                              style: trueBlackTextStyle.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                    SizedBox(height: sy(6)),
                    Container(
                        padding: EdgeInsets.all(10),
                        width: sx(400),
                        child: Text('${visiting.shop_address}',
                            overflow: TextOverflow.ellipsis,
                            style: trueBlackTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400))),
                  ],
                ),
              ),
            ),
          ),
          child: Container(
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
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text('${visiting.shop_name}',
                                  overflow: TextOverflow.ellipsis,
                                  style: trueBlackTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text('${visiting.shop_address}',
                                  overflow: TextOverflow.ellipsis,
                                  style: trueBlackTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300)),
                            ),
                          ],
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
