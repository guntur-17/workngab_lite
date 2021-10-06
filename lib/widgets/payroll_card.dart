import 'package:flutter/material.dart';
import 'package:absen_lite/theme.dart';

class PayrollCard extends StatelessWidget {
  const PayrollCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 60,
      padding: EdgeInsets.only(right: 13, left: 19),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: blueShadow,
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/payroll.png',
                  width: 30, height: 30, color: trueBlack),
              SizedBox(
                width: 6,
              ),
              Text('Desember 2021',
                  style: trueBlackTextStyle.copyWith(
                      fontSize: 12, fontWeight: reguler))
            ],
          ),
          Image.asset('assets/download.png', width: 105, height: 25),
        ],
      ),
    );
  }
}
