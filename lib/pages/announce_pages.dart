import 'package:absensi_project/widgets/announce_card.dart';
import 'package:absensi_project/widgets/meeting_card.dart';
import 'package:flutter/material.dart';
import 'package:absensi_project/theme.dart';

class AnnouncePage extends StatelessWidget {
  const AnnouncePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 57),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/back.png',
                            width: 26,
                            height: 26,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 57),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                          Text(
                            'Announcement',
                            style: blackTextStyle.copyWith(
                                fontSize: 20, fontWeight: semiBold),
                          ),
                        ],
                      )),
                  Container(
                    child: Image.asset(
                      'assets/rounded.png',
                      width: 130,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget filter() {
      return Container(
        width: MediaQuery.of(context).size.width * 0.94,
        margin: EdgeInsets.only(top: 106),
        child: Align(
          alignment: Alignment.topRight,
          child: Image.asset(
            'assets/filter.png',
            width: 114,
          ),
        ),
      );
    }

    Widget card() {
      return Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          margin: EdgeInsets.only(top: 151),
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                width: MediaQuery.of(context).size.width * 0.90,
                child: Column(
                  children: [
                    AnnounceCard(),
                    SizedBox(
                      height: 7,
                    ),
                    AnnounceCard(),
                    SizedBox(
                      height: 7,
                    ),
                    AnnounceCard(),
                    SizedBox(
                      height: 7,
                    ),
                    AnnounceCard(),
                    SizedBox(
                      height: 7,
                    ),
                    AnnounceCard(),
                    SizedBox(
                      height: 7,
                    ),
                    AnnounceCard(),
                    SizedBox(
                      height: 7,
                    ),
                    AnnounceCard(),
                    SizedBox(
                      height: 7,
                    ),
                    AnnounceCard(),
                    SizedBox(
                      height: 7,
                    ),
                    AnnounceCard(),
                    SizedBox(
                      height: 7,
                    ),
                    AnnounceCard(),
                    SizedBox(
                      height: 7,
                    ),
                    AnnounceCard(),
                    SizedBox(
                      height: 7,
                    ),
                    AnnounceCard(),
                    SizedBox(
                      height: 7,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Stack(
          children: [
            header(),
            filter(),
            card(),
          ],
        ),
      ),
    );
  }
}
