import 'package:absen_lite/models/visiting_all_model.dart';
import 'package:absen_lite/theme.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class VisitingCard extends StatelessWidget {
  final VisistingAllModel visiting;
  const VisitingCard(this.visiting, {Key? key}) : super(key: key);

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/toko.png',
                            width: sx(60), height: sx(60)),
                        const SizedBox(
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
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Row(
                        children: [
                          Image.asset('assets/mappin.png',
                              height: sx(12), width: sx(12)),
                          const SizedBox(
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
                        padding: const EdgeInsets.all(10),
                        width: sx(400),
                        child: Text('${visiting.shop_address}',
                            // overflow: TextOverflow.fade,
                            style: trueBlackTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400))),
                  ],
                ),
              ),
            ),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
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
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text('${visiting.shop_name}',
                          overflow: TextOverflow.ellipsis,
                          style: trueBlackTextStyle.copyWith(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text('${visiting.shop_address}',
                          overflow: TextOverflow.ellipsis,
                          style: trueBlackTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w300)),
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
