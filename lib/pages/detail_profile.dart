import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
import '../theme.dart';

class DetailProfile extends StatelessWidget {
  const DetailProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget photo() {
      return Container(
        margin: EdgeInsets.only(top: 15, bottom: 9),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Column(
                children: [
                  Image.asset(
                    'assets/avatar.png',
                    fit: BoxFit.fill,
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget nama() {
      return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: EdgeInsets.only(top: 9, bottom: 9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Lengkap',
              style: blackTextStyle.copyWith(fontSize: 14, fontWeight: reguler),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: notsoWhite),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8),
                      child: Text(
                        'Farino Joshua',
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: reguler),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget jabatan() {
      return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: EdgeInsets.only(top: 9, bottom: 9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jabatan',
              style: blackTextStyle.copyWith(fontSize: 14, fontWeight: reguler),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: notsoWhite),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        'Staff IT',
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: reguler),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget nik() {
      return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: EdgeInsets.only(top: 9, bottom: 9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NIK',
              style: blackTextStyle.copyWith(fontSize: 14, fontWeight: reguler),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: notsoWhite),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        '3212131707990001',
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: reguler),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget username() {
      return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: EdgeInsets.only(top: 9, bottom: 9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: blackTextStyle.copyWith(fontSize: 14, fontWeight: reguler),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: notsoWhite),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        'Admoon',
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: reguler),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget email() {
      return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: EdgeInsets.only(top: 9, bottom: 9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: blackTextStyle.copyWith(fontSize: 14, fontWeight: reguler),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: notsoWhite),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        'farinojoshua@gmail.com',
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: reguler),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget gender() {
      return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: EdgeInsets.only(top: 9, bottom: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jenis Kelamin',
              style: blackTextStyle.copyWith(fontSize: 14, fontWeight: reguler),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: notsoWhite),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        'Sigma Male',
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: reguler),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            toolbarHeight: 120,
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
            backgroundColor: Colors.white,
            bottomOpacity: 0.0,
            elevation: 0.0,
            title: new Text(
              'Profile',
              style: trueBlackTextStyle.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                photo(),
                nama(),
                jabatan(),
                nik(),
                username(),
                email(),
                gender()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
