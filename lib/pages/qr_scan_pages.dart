import 'dart:io';

import 'package:absen_lite/pages/dashboard_pages.dart';
import 'package:absen_lite/pages/home.dart';
import 'package:absen_lite/pages/success_pages.dart';
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
  String? addressUser;

  Scanner(this.lat, this.long, this.addressUser);

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
    String? addressUser = widget.addressUser;
    // double latUser = currentposition!.latitude;
    // double longUser = currentposition!.longitude;
    ScannerProvider scannerProvider = Provider.of<ScannerProvider>(context);

    handleUploadScanner(String? shopName) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      if (await scannerProvider.visitingScanner(
          token, addressUser, result!.code, latUser, longUser)) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SuccessPages(shopName)));
      }
    }

    handleDiluarJangkauanScanner() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: redColor,
        content: Text(
          'Not in Range..',
          textAlign: TextAlign.center,
        ),
        // duration: Duration(seconds: 2),
      ));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
      // ScaffoldMessenger.of(context).removeCurrentSnackBar();
    }

    handleSalahScanner() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: redColor,
        content: Text(
          'wrong barcode',
          textAlign: TextAlign.center,
        ),
        // duration: Duration(seconds: 2),
      ));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
      // ScaffoldMessenger.of(context).removeCurrentSnackBar();
    }

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
                    // var barcode =
                    //     '3l8k33LxWaINdqxjwv5eElWNm58ydOE8mzEIRey1kmR7s2W8Sa8thxR5a3B8';
                    // double latTest = -6.3454;
                    // double longTest = 106.8283;
                    if (await scannerProvider.scanQR(
                      token: token,
                      barcode: result!.code,
                    )
                        // userLocation.isInRange == true,
                        )
                    //   {
                    // if (result!.code == barcode)
                    {
                      ScannerModel shop = scannerProvider.data;
                      double radius = Geolocator.distanceBetween(
                          latUser!, longUser!, shop.lat!, shop.long!);
                      int? id = shop.id;
                      if (radius <= 300) {
                        handleUploadScanner(shop.name);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => StockListPage(latUser,
                        //             longUser, id, result!.code, addressUser)));
                      } else {
                        handleDiluarJangkauanScanner();
                        print('not in range');
                      }
                      print(latUser);
                      print(longUser);
                    } else {
                      handleSalahScanner();
                      print('wrong barcode');
                    }
                  }
                  // }
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
