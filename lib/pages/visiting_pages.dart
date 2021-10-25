import 'dart:io';
import 'package:absen_lite/pages/shop_list_pages.dart';
import 'package:absen_lite/providers/auth_provider.dart';
import 'package:absen_lite/providers/shop_provider.dart';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:absen_lite/pages/qr_scan_pages.dart';

import 'package:flutter/material.dart';
import 'package:absen_lite/theme.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class VisitingPage extends StatefulWidget {
  static const String _title = 'Visiting';

  @override
  State<VisitingPage> createState() => _VisitingPageState();
}

class _VisitingPageState extends State<VisitingPage> {
  DateFormat? dateFormat;
  DateFormat? timeFormat;
  File? image;

  dynamic currentTime = DateFormat.Hm().format(DateTime.now());
  String currentAddress = 'My Address';

  Position? currentposition;

  bool isLoading = false;

  void initState() {
    super.initState();
    _determinePosition();
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('id_ID');
    timeFormat = DateFormat.Hms('id_ID');
  }

  Future<Position?> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    setState(() {
      isLoading = true;
    });

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please Keep your location on.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location Permission is denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: 'Permission is denied Forever');
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];

      setState(() {
        currentposition = position;
        currentAddress =
            " ${place.street}, ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.administrativeArea} ${place.postalCode}";
        setState(() {
          isLoading = false;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  String? _result;
  File? _picker;

  @override
  Widget build(BuildContext context) {
    ShopProvider shopProvider =
        Provider.of<ShopProvider>(context, listen: false);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    Widget text() {
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Choose Your Choice',
              style:
                  trueBlackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
            ),
            Text(
              'You can scan barcode or take a selfie',
              style:
                  trueBlackTextStyle.copyWith(fontSize: 14, fontWeight: light),
            )
          ],
        ),
      );
    }

    Future _openScanner(BuildContext context) async {
      double lat = currentposition!.latitude;
      double long = currentposition!.longitude;
      final result = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (c) => Scanner(lat, long, currentAddress)));
      _result = result;
    }

    Future _getPhoto(BuildContext context) async {
      // double lat = currentposition!.latitude;
      // double long = currentposition!.longitude;
      final picker = await Navigator.push(context,
          MaterialPageRoute(builder: (c) => ShopListPage(currentAddress)));
      _picker = picker;
    }

    Widget barcode() {
      return InkWell(
        onTap: () {
          _openScanner(context);
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: blackColor,
                    blurRadius: 1,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                        style: trueBlackTextStyle.copyWith(
                            fontSize: 16, fontWeight: bold),
                      ),
                    ],
                  ),
                  SizedBox(
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
          shopProvider.getShops(authProvider.user.access_token);
          _getPhoto(context);
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: trueBlack,
                    blurRadius: 1,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                        style: trueBlackTextStyle.copyWith(
                            fontSize: 16, fontWeight: bold),
                      ),
                    ],
                  ),
                  SizedBox(
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
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
            backgroundColor: Colors.white,
            bottomOpacity: 0.0,
            elevation: 0.0,
            // title: Text(
            //   'Visiting',
            //   style: TextStyle(color: Colors.black),
            // ),
            actions: <Widget>[
              Image(image: AssetImage('assets/rounded.png')),
            ],
          ),
        ),
        backgroundColor: whiteColor,
        body: Column(
          children: [text(), barcode(), selfie()],
        ),
      ),
    );
  }
}
