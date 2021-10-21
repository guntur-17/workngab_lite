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
  }) async {
    var url = Uri.parse('$baseUrl/user/visiting/shop/check/$barcode');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token as String
    };
    // var body = jsonEncode({'lat': lat, 'long': long});
    var response = await http.get(url, headers: headers);
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

  Future<bool> visitingScanner(
    String? token,
    String? address,
    String? barcode,
    double? lat,
    double? long,
  ) async {
    var url = Uri.parse('$baseUrl/user/visiting/shop/$barcode');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token as String
    };
    var body = jsonEncode({'address': address, 'lat': lat, 'long': long});

    var response = await http.post(url, headers: headers, body: body);

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal upload visiting Scanner');
    }
  }
}
