import 'dart:convert';

import 'package:absen_lite/models/shop_model.dart';
import 'package:http/http.dart' as http;

class ShopService {
  // var data = [];
  // List<ShopModel> shops = [];
  String baseUrl = 'http://decoy.sakataguna-dev.com/api';

  Future<List<ShopModel>> getShops({String? token, String? query}) async {
    var url = Uri.parse('$baseUrl/user/show-shop');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token as String
    };

    var response = await http.get(url, headers: headers);

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      List data = json.decode(response.body)['data']['shop'];
      List<ShopModel> shops =
          data.map((json) => ShopModel.fromJson(json)).where((shop) {
        final titleLower = shop.name.toLowerCase();
        final searchLower = query!.toLowerCase();

        return titleLower.contains(searchLower);
      }).toList();
      // toList();
      // if (query != null) {
      //   shops = shops
      //       .where(
      //           (shop) => shop.name.toLowerCase().contains(query.toLowerCase()))
      //       .toList();
      // }
      // AttendanceModel attendance = AttendanceModel.fromJson(data['attendance']);
      // attendance.token = 'Bearer' + data['access_token'];
      // print(data);

      // for (var item in data) {
      //   shops.add(ShopModel.fromJson(item));
      // }

      return shops;
    } else {
      throw Exception('Gagal Get shop');
    }
  }
}
