import 'package:absen_lite/models/product_model.dart';

import 'package:absen_lite/services/product_service.dart';
import 'package:flutter/widgets.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _showProduct = [];

  List<ProductModel> get showProduct => _showProduct;

  set showProduct(List<ProductModel> showProduct) {
    _showProduct = showProduct;
    notifyListeners();
  }

  // Future<bool> getShopAll(String? token) async {
  //   try {
  //     List<ShopModel> showShop = await ShopService().getShopAll(token: token);
  //     _showShop = showShop;
  //     return true;
  //   } catch (e) {
  //     print(e);

  //     return false;
  //   }
  // }

  Future<bool> getProduct(int? id, String? token) async {
    try {
      List<ProductModel> showProduct =
          await ProductService().getProduct(id, token);
      _showProduct = showProduct;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Future<bool> updateProduct(
  //     int? id, int? shop_id, String? token, String? name, int? stock) async {
  //   try {
  //     if (await ShopService().updateProduct(id, shop_id, token, name, stock)) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }
}
