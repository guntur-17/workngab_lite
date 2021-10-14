import 'package:absen_lite/models/scanner_model.dart';
import 'package:absen_lite/services/scanner_service.dart';
import 'package:flutter/widgets.dart';

class ScannerProvider with ChangeNotifier {
  ScannerModel? _data;

  ScannerModel get data => _data as ScannerModel;
  set data(ScannerModel data) {
    _data = data;
    notifyListeners();
  }

  Future<bool> scanQR({
    String? token,
    String? barcode,
    double? lat,
    double? long,
  }) async {
    try {
      // if (await ScannerService()
      //     .scanQR(token: token, barcode: barcode, lat: lat, long: long)) {
      //   return true;
      // } else {
      //   return false;
      // }
      ScannerModel data = await ScannerService()
          .scanQR(token: token, barcode: barcode, lat: lat, long: long);
      _data = data;
      return true;
    } catch (e) {
      print(e);
      print('salah scan');
      return false;
    }

    // try {
    //   if (await AuthService().logout(token)) {
    //     return true;
    //   } else {
    //     return false;
    //   }
    // } catch (e) {
    //   print(e);
    //   print('salah provider');
    //   return false;
    // }
  }
}
