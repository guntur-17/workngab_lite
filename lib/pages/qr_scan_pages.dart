import 'dart:io';

import 'package:absen_lite/pages/dashboard_pages.dart';
import 'package:absen_lite/pages/home.dart';
import 'package:absen_lite/providers/scanner_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:absen_lite/services/scanner_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:absen_lite/models/scanner_model.dart';
import 'package:absen_lite/pages/stock_list_pages.dart';
import 'package:absen_lite/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:absen_lite/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Scanner extends StatefulWidget {
  // const Scanner({Key? key}) : super(key: key);
  double? lat;
  double? long;

  Scanner(this.lat, this.long);

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  bool _flashOn = false;
  bool _frontCam = false;
  GlobalKey _qrKey = GlobalKey();
  QRViewController? _controller;
  Barcode? result;

  @override
  Widget build(BuildContext context) {
    double? latUser = widget.lat;
    double? longUser = widget.long;
    // double latUser = currentposition!.latitude;
    // double longUser = currentposition!.longitude;
    ScannerProvider scannerProvider = Provider.of<ScannerProvider>(context);
    double radius = Geolocator.distanceBetween(
        latUser!, longUser!, -6.345467377355538, 106.82834248759139);
    // var userLocation = Provider.of<GeoLocation>(context);
    // userLocation.radiuscentermeters = 1000; //1000 = 100 meters
    // userLocation.setPointCenter(dummyCenterLatitude, dummyCenterLongitude);
    return Scaffold(
      body: Stack(
        children: [
          QRView(
              key: _qrKey,
              overlay: QrScannerOverlayShape(borderColor: whiteColor),
              onQRViewCreated: (QRViewController controller) {
                this._controller = controller;
                //cetak hasil scan
                controller.scannedDataStream.listen((val) async {
                  if (mounted) {
                    _controller!.dispose();
                    setState(() {
                      result = val;
                      print(val);
                      print(result!.code);
                    });
                    // await authProvider.login(
                    //     username: 'nadine10', password: '12345678');
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    var token = prefs.getString('token');
                    var barcode =
                        '3l8k33LxWaINdqxjwv5eElWNm58ydOE8mzEIRey1kmR7s2W8Sa8thxR5a3B8';
                    double latTest = -6.3454;
                    double longTest = 106.8283;
                    if (await scannerProvider.scanQR(
                                token: token,
                                barcode: barcode,
                                lat: latTest,
                                long: longTest) &&
                            radius <= 300
                        // userLocation.isInRange == true,
                        ) {
                      if (result!.code == barcode) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StockListPage()));
                        print(radius);
                        print(latUser);
                        print(longUser);
                      } else {
                        print('not in range');
                      }
                    }
                  }
                });
              }),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 60),
              child: Text(
                'Scanner',
                style: TextStyle(
                    fontSize: 18, fontWeight: bold, color: whiteColor),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        _flashOn = !_flashOn;
                      });
                      _controller!.toggleFlash();
                    },
                    icon: Icon(_flashOn ? Icons.flash_on : Icons.flash_off)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        _frontCam = !_frontCam;
                      });
                      _controller!.flipCamera();
                    },
                    icon: Icon(
                        _frontCam ? Icons.camera_front : Icons.camera_rear)),
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
