import 'dart:convert';

import 'package:absen_lite/models/product_model.dart';

import 'package:http/http.dart' as http;

class ProductService {
  String baseUrl = 'http://decoy.sakataguna-dev.com/api';

  // Future<List<ProductModel>> getShopAll({
  //   int? id,
  //   int? shop_id,
  //   String? token,
  // }) async {
  //   var url = Uri.parse('$baseUrl/user/visiting/shop/history');
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': token as String
  //   };
  //   var response = await http.get(url, headers: headers);
  //   print(response.statusCode);
  //   print(response.body);

  //   if (response.statusCode == 200) {
  //     List shop = jsonDecode(response.body)['data']['visiting'];
  //     List<ProductModel> showShop = [];

  //     for (var item in shop) {
  //       showShop.add(ProductModel.fromJson(item));
  //     }
  //     return showShop;
  //   } else {
  //     throw Exception('Gagal Get Shop');
  //   }
  // }

  Future<List<ProductModel>> getProduct(int? id, String? token) async {
    var url = Uri.parse('$baseUrl/user/visiting/shop/$id');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token as String
    };

    var response = await http.get(url, headers: headers);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      List product = jsonDecode(response.body)['data']['items'];
      List<ProductModel> showProduct = [];

      for (var item in product) {
        showProduct.add(ProductModel.fromJson(item));
      }
      return showProduct;
    } else {
      throw Exception('Gagal get Product');
    }
  }

  // Future<bool> updateProduct(
  //     int? id, int? shop_id, String? token, String? name, int? stock) async {
  //   var url = Uri.parse('$baseUrl/user/visiting/update-stock/shop/$shop_id');
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': token as String
  //   };
  //   var body = jsonEncode({name, stock});
  //   var response = await http.post(url, headers: headers, body: body);

  //   print(response.statusCode);
  //   print(response.body);

  //   if (response.statusCode == 200) {
  //     return true;
  //   } else {
  //     throw Exception('Gagal Update Product');
  //   }
  // }
}
