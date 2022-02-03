import 'package:absen_lite/pages/home.dart';
import 'package:absen_lite/pages/success_pages.dart';
import 'package:absen_lite/providers/scanner_provider.dart';
import 'package:geolocator/geolocator.dart';

import 'package:absen_lite/models/scanner_model.dart';

import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:absen_lite/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Scanner extends StatefulWidget {
  final double? lat;
  final double? long;
  final String? addressUser;

  const Scanner(this.lat, this.long, this.addressUser, {Key? key})
      : super(key: key);

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  bool _flashOn = false;
  bool _frontCam = false;
  final GlobalKey _qrKey = GlobalKey();
  QRViewController? _controller;
  Barcode? result;

  @override
  Widget build(BuildContext context) {
    double? latUser = widget.lat;
    double? longUser = widget.long;
    String? addressUser = widget.addressUser;

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
        content: const Text(
          'Not in Range..',
          textAlign: TextAlign.center,
        ),
      ));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);
    }

    handleSalahScanner() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: redColor,
        content: const Text(
          'wrong barcode',
          textAlign: TextAlign.center,
        ),
      ));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);
    }

    return Scaffold(
      body: Stack(
        children: [
          QRView(
              key: _qrKey,
              overlay: QrScannerOverlayShape(borderColor: whiteColor),
              onQRViewCreated: (QRViewController controller) {
                _controller = controller;
                //cetak hasil scan
                controller.scannedDataStream.listen((val) async {
                  if (mounted) {
                    _controller!.dispose();
                    setState(() {
                      result = val;
                      print(val);
                      print(result!.code);
                    });

                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    var token = prefs.getString('token');

                    if (await scannerProvider.scanQR(
                      token: token,
                      barcode: result!.code,
                    )) {
                      ScannerModel shop = scannerProvider.data;
                      double radius = Geolocator.distanceBetween(
                          latUser!, longUser!, shop.lat!, shop.long!);
                      // int? id = shop.id;
                      if (radius <= 300) {
                        handleUploadScanner(shop.name);
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
              margin: const EdgeInsets.only(top: 60),
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
                    icon: const Icon(Icons.close)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
