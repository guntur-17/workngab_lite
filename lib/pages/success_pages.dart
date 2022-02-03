import 'package:absen_lite/pages/home.dart';
import 'package:absen_lite/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:relative_scale/relative_scale.dart';

class SuccessPages extends StatefulWidget {
  final String? shopName;
  const SuccessPages(this.shopName, {Key? key}) : super(key: key);

  @override
  State<SuccessPages> createState() => _SuccessPagesState();
}

class _SuccessPagesState extends State<SuccessPages> {
  DateFormat? dateFormat;

  dynamic currentTime = DateFormat.Hm().format(DateTime.now());

  void initState() {
    super.initState();

    initializeDateFormatting();

    dateFormat = DateFormat.yMMMMd('id_ID');
  }

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return RelativeBuilder(builder: (context, height, width, sy, sx) {
        return Container(
          margin: EdgeInsets.only(top: sy(30)),
          child: Text(
            'Visiting Success',
            style: trueBlackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
          ),
        );
      });
    }

    Widget subtitle() {
      return RelativeBuilder(builder: (context, height, width, sy, sx) {
        return Text(
          'You have successfully made\nattendance visit',
          style: blackTextStyle.copyWith(fontSize: 14, fontWeight: reguler),
          textAlign: TextAlign.center,
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
                '$currentTime',
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
        return SizedBox(
          height: sy(60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                        '${widget.shopName}',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: trueBlackTextStyle.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '${DateFormat.yMMMMEEEEd('id_ID').format(DateTime.now())}',
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
        return InkWell(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false);
          },
          child: Container(
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
                  style: whiteTextStyle.copyWith(
                      fontSize: 14, fontWeight: reguler),
                ),
                Image.asset(
                  'assets/kanan.png',
                  width: sx(20),
                  height: sy(20),
                ),
              ],
            ),
          ),
        );
      });
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/successScan.png'),
                  fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [title(), subtitle(), time(), shop(), button()],
          ),
        ),
      ),
    );
  }
}
