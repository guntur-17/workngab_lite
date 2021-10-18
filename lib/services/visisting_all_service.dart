import 'dart:convert';

import 'package:absen_lite/models/visiting_all_model.dart';
import 'package:http/http.dart' as http;

class VisitingAllService {
  String baseUrl = 'http://decoy.sakataguna-dev.com/api';

  Future<List<VisistingAllModel>> getAllVisit({String? token}) async {
    var url = Uri.parse('$baseUrl/user/visiting/history');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token as String
    };
    var response = await http.get(url, headers: headers);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      List visiting_all = jsonDecode(response.body)['data']['visiting'];
      List<VisistingAllModel> visitingall = [];

      for (var item in visiting_all) {
        visitingall.add(VisistingAllModel.fromJson(item));
      }
      return visitingall;
    } else {
      throw Exception('Gagal get all visiting');
    }
  }
}
