import 'package:absen_lite/models/shop_model.dart';
import 'package:absen_lite/services/shop_service.dart';
import 'package:flutter/widgets.dart';

class ShopProvider with ChangeNotifier {
  List<ShopModel> _shops = [];
  List<ShopModel> get shops => _shops;

  set shops(List<ShopModel> shops) {
    _shops = shops;
    notifyListeners();
  }

  Future<bool> getShops(String? token) async {
    try {
      List<ShopModel> shops = await ShopService().getShops(token: token);
      _shops = shops;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
