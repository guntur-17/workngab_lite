import 'package:absensi_project/theme.dart';
import 'package:flutter/material.dart';
import 'success_reimb_pages.dart';

class ReimbursementPage extends StatefulWidget {
  ReimbursementPage({Key? key}) : super(key: key);

  @override
  _ReimbursementPageState createState() => _ReimbursementPageState();
}

class _ReimbursementPageState extends State<ReimbursementPage> {
  String dropdownValueReimb = 'Sekarang';
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
                            width: MediaQuery.of(context).size.width * 0.21,
                          ),
                          Text(
                            'Reimbursement',
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

    Widget date() {
      return Container(
        margin: EdgeInsets.only(top: 117),
        padding: EdgeInsets.only(left: 20, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'When',
              style: blackTextStyle.copyWith(fontSize: 12, fontWeight: reguler),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              margin: EdgeInsets.only(top: 3),
              height: 54,
              decoration: BoxDecoration(color: whiteColor),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(
                      right: 21,
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/date.png'))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Container(),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget reimbursement() {
      return Container(
        margin: EdgeInsets.only(top: 191),
        padding: EdgeInsets.only(left: 20, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reimbursement',
              style: blackTextStyle.copyWith(fontSize: 12, fontWeight: reguler),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              margin: EdgeInsets.only(top: 3),
              height: 54,
              decoration: BoxDecoration(color: whiteColor),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(
                      right: 21,
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/reimb.png'))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: DropdownButton<String>(
                      value: dropdownValueReimb,
                      icon: Icon(Icons.arrow_drop_down),
                      iconEnabledColor: blueColor,
                      iconSize: 20,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValueReimb = newValue!;
                        });
                      },
                      items: <String>[
                        'Sekarang',
                        'Besok',
                        'Lusa',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      isExpanded: true,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget desc() {
      return Container(
        margin: EdgeInsets.only(top: 273),
        padding: EdgeInsets.only(left: 20, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: blackTextStyle.copyWith(fontSize: 12, fontWeight: reguler),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              margin: EdgeInsets.only(top: 3),
              height: 54,
              decoration: BoxDecoration(color: whiteColor),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(
                      right: 21,
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/desc.png'))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: 30,
                    child: TextField(
                      decoration:
                          InputDecoration(hintText: 'Type Something...'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget upload() {
      return Container(
        margin: EdgeInsets.only(top: 350),
        padding: EdgeInsets.only(left: 20, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upload File',
              style: blackTextStyle.copyWith(fontSize: 12, fontWeight: reguler),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              margin: EdgeInsets.only(top: 3),
              height: 54,
              decoration: BoxDecoration(color: whiteColor),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(
                      right: 21,
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/uploadFile.png'))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: 30,
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Max 2Mb'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget buttonRequest() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 250),
          width: MediaQuery.of(context).size.width * 0.85,
          height: 57,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: blueColor),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SuccessReimbPage()));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Request',
                  style:
                      whiteTextStyle.copyWith(fontSize: 20, fontWeight: medium),
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget buttonCancel() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 380),
          width: MediaQuery.of(context).size.width * 0.85,
          height: 57,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: whiteColor),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Cancel',
                  style:
                      blueTextStyle.copyWith(fontSize: 20, fontWeight: medium),
                )
              ],
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
            date(),
            reimbursement(),
            desc(),
            upload(),
            buttonRequest(),
            buttonCancel()
          ],
        ),
      ),
    );
  }
}
