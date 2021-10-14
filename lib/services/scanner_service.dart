import 'dart:convert';

import 'package:absen_lite/models/scanner_model.dart';
import 'package:absen_lite/providers/scanner_provider.dart';

import 'package:http/http.dart' as http;

class ScannerService {
  String baseUrl = 'http://decoy.sakataguna-dev.com/api';
  // String barcode = ScannerProvider.scanner.barcode;

  Future<ScannerModel> scanQR({
    // String? name,
    String? token,
    String? barcode,
    // String? address,

    double? lat,
    double? long,
  }) async {
    var url = Uri.parse('$baseUrl/user/visiting/shop/$barcode');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token as String
    };
    var body = jsonEncode({'lat': lat, 'long': long});
    var response = await http.post(url, headers: headers, body: body);
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      var dataa = jsonDecode(response.body)['data'];
      ScannerModel data = ScannerModel.fromJson(dataa['visiting']);

      return data;
    } else {
      throw Exception('Gagal Scan');
    }
  }
}
