import 'dart:io';

import 'package:absen_lite/pages/dashboard_pages.dart';
import 'package:absen_lite/pages/home.dart';
import 'package:absen_lite/pages/stock_list_pages.dart';
import 'package:absen_lite/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:absen_lite/geolocation_class/geolocation_class.dart';
import 'package:absen_lite/geolocation_class/geolocation_pos.dart';
import 'package:absen_lite/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

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
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    var userLocation = Provider.of<GeoLocation>(context);
    userLocation.radiuscentermeters = 1000; //1000 = 100 meters
    userLocation.setPointCenter(dummyCenterLatitude, dummyCenterLongitude);
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
                    if (await authProvider.getUser(token: token) &&
                        userLocation.isInRange == true) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StockListPage()));
                    } else {
                      print('not in range');
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
