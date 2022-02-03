import 'package:flutter/material.dart';
import 'package:absen_lite/theme.dart';

class HourCard extends StatelessWidget {
  const HourCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.20,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: whiteColor,
          border: Border.all(color: blueColor, width: 1)),
      child: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          Image.asset(
            'assets/masuk.png',
            width: 30,
            height: 30,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            '09:10',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'Clock In',
            style: blackTextStyle.copyWith(fontSize: 10, fontWeight: light),
          )
        ],
      ),
    );
  }
}

class ClockOut extends StatelessWidget {
  const ClockOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.20,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: whiteColor,
          border: Border.all(color: blueColor, width: 1)),
      child: Column(
        children: [
          const SizedBox(
            height: 6,
          ),
          Image.asset(
            'assets/pulang.png',
            width: 30,
            height: 30,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            '--:--',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'Clock Out',
            style: blackTextStyle.copyWith(fontSize: 10, fontWeight: light),
          )
        ],
      ),
    );
  }
}

class FullHour extends StatelessWidget {
  const FullHour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.20,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: whiteColor,
          border: Border.all(color: blueColor, width: 1)),
      child: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          Image.asset(
            'assets/jamKerja.png',
            width: 30,
            height: 30,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            '12:20',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'Working Hrs',
            style: blackTextStyle.copyWith(fontSize: 10, fontWeight: light),
          )
        ],
      ),
    );
  }
}
