import 'package:flutter/material.dart';
import '../theme.dart';

class SuccessReimbPage extends StatelessWidget {
  const SuccessReimbPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 120),
        width: 330,
        height: 20,
        decoration: BoxDecoration(color: borderGreen),
        padding: EdgeInsets.only(right: 8),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -7,
              child: Row(
                children: [
                  SizedBox(width: 5),
                  Text('Permintaan sedang diproses...',
                      style: blackTextStyle.copyWith(
                          fontSize: 20, fontWeight: semiBold)),
                  Image.asset(
                    'assets/proses.png',
                    width: 28,
                    height: 28,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget gambar() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        child: Center(
          child: Image.asset(
            'assets/jamPasir.png',
            width: 207,
            height: 225,
          ),
        ),
      );
    }

    Widget text() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Center(
          child: Text(
            'Permintaan kamu sedang diproses ya silahkan\ndicek dilaman pengumuman ya',
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: light),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    Widget buttonsemi() {
      return Container(
        margin: EdgeInsets.only(top: 40, right: 60, left: 30),
        width: MediaQuery.of(context).size.width * 0.7,
        child: InkWell(
          onTap: () {
            int count = 0;
            Navigator.of(context).popUntil((_) => count++ >= 2);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/arrowBack.png',
                width: 9,
                height: 18,
              ),
              Text(
                'Kembali ke Menu Utama',
                style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: reguler),
              )
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/success.png'), fit: BoxFit.fill)),
          child: Column(
            children: [title(), gambar(), text(), buttonsemi()],
          ),
        ),
      ),
    );
  }
}
