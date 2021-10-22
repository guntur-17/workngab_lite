import 'package:flutter/material.dart';

import '../theme.dart';

class ChoicePages extends StatelessWidget {
  const ChoicePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget text() {
      return Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 22, right: 22, top: 5),
              child: Text(
                'Choose Your Choice',
                style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 22, right: 22, top: 1),
              child: Text(
                'You can scan barcode or take a selfie',
                style: blackTextStyle.copyWith(fontSize: 14, fontWeight: light),
              ),
            )
          ],
        ),
      );
    }

    Widget barcode() {
      return InkWell(
        onTap: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => GuideOption()));
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: blackColor,
                    blurRadius: 2,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/barcode.png',
                          width: 50,
                          height: 50,
                        ),
                        Image.asset(
                          'assets/vertical.png',
                          width: 50,
                          height: 50,
                        ),
                        Text(
                          'Scan Barcode',
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/rightButton.png',
                          width: 20,
                          height: 20,
                          color: blackColor,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget selfie() {
      return InkWell(
        onTap: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => GuideOption()));
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: blackColor,
                    blurRadius: 2,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/selfie.png',
                          width: 50,
                          height: 50,
                        ),
                        Image.asset(
                          'assets/vertical.png',
                          width: 50,
                          height: 50,
                        ),
                        Text(
                          'Take a Selfie',
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/rightButton.png',
                          width: 20,
                          height: 20,
                          color: blackColor,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            toolbarHeight: 120,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: trueBlack,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            // iconTheme: IconThemeData(color: Colors.black),
            // centerTitle: true,
            backgroundColor: Colors.white,
            bottomOpacity: 0.0,
            elevation: 0.0,
            // title: Text(
            //   'Attendance',
            //   style: TextStyle(color: Colors.black),
            // ),
            actions: <Widget>[
              Container(
                child: Image(image: AssetImage('assets/rounded.png')),
              ),
            ],
          ),
        ),
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [text(), barcode(), selfie()],
          ),
        ),
      ),
    );
  }
}
