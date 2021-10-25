import 'dart:convert';
import 'dart:io';

import 'package:absen_lite/models/scanner_model.dart';

import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart' as dio;
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
      'Content-Type': 'multipart/from-data',
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

  Future<bool> visitingPhoto(
    int? id,
    String? token,
    String? address,
    // double? lat,
    // double? long,
    File? image,
  ) async {
    // var stream = new http.ByteStream(DelegatingStream.typed(_image.openRead()));
    // var bytes = image?.readAsBytesSync();
    // var url = Uri.parse('$baseUrl/user/visiting/shop/photo/$id');
    // var headers = {
    //   'Content-Type': 'application/json',
    //   'Authorization': token as String
    // };
    // var body = jsonEncode({'address': address, 'photo': bytes});

    // // var response = await http.post(url, headers: headers, body: body);

    // var postUri = Uri.parse('$baseUrl/user/visiting/shop/photo/$id');
    // var request = new http.MultipartRequest("POST", url);
    // request.headers.addAll(headers);

    // request.fields['address'] = address!;

    // request.files.add(
    //   new http.MultipartFile.fromBytes(
    //     'file',
    //     await File.fromUri(Uri.parse("$image")).readAsBytes(),
    //     contentType: new MediaType('image', 'jpeg'),
    //   ),
    // );

    // request.send().then(
    //   (response) {
    //     if (response.statusCode == 200) {
    //       print("Uploaded!");
    //       return true;
    //     } else {
    //       print('salah');
    //     }
    //   },
    // );

    // print(response.statusCode);
    // print(response.body);

    // if (response.statusCode == 200) {
    //   return true;
    // } else {
    //   throw Exception('Gagal upload visiting Photo');
    // }
    try {
      // print(image);
      var dioRequest = dio.Dio();
      dioRequest.options.baseUrl = '$baseUrl/user/visiting/shop/photo/$id';
      dioRequest.options.headers = {
        'Authorization': '$token',
        'Content-Type': 'multipart/form-data'
      };

      var formData = new dio.FormData.fromMap({'address': '$address'});
      var file = await dio.MultipartFile.fromFile(image!.path,
          filename: basename(image.path),
          contentType: MediaType("image", basename(image.path)));
      formData.files.add(MapEntry('photo', file));

      var response = await dioRequest.post(
        dioRequest.options.baseUrl,
        data: formData,
      );
      final result = json.decode(response.toString())['result'];
      return true;
    } catch (err) {
      print('ERROR  $err');
      return false;
    }
  }
}
