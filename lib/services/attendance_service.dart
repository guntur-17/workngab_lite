import 'dart:convert';

import 'package:absen_lite/models/attendance_model.dart';
import 'package:absen_lite/models/user_model.dart';
import 'package:absen_lite/providers/auth_provider.dart';
import 'package:http/http.dart' as http;

class AttendanceService {
  String baseUrl = 'http://workab.sakataguna-dev.com/api';
  // String token = AuthProvider.user.token;

  Future<List<AttendanceModel>> getAttendances(String? token) async {
    // var token = await.getToken();
    var url = Uri.parse('$baseUrl/user/attendance/history');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token as String
    };

    // var body = jsonEncode({
    //   'type': type,
    //   'time': time,
    //   'created_at': created_at,
    // });

    var response = await http.get(url, headers: headers);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['attendance'];
      List<AttendanceModel> attendances = [];
      // AttendanceModel attendance = AttendanceModel.fromJson(data['attendance']);
      // attendance.token = 'Bearer' + data['access_token'];
      // print(data);

      for (var item in data) {
        attendances.add(AttendanceModel.fromJson(item));
      }

      return attendances;
    } else {
      throw Exception('Gagal Get attendances');
    }
  }

  Future<bool> attendanceIn(
    String? token,
    String? time,
    String? lat,
    String? long,
  ) async {
    var url = Uri.parse('$baseUrl/user/attendance-in');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token as String
    };
    var body = jsonEncode({'time': time, 'lat': lat, 'long': long});

    var response = await http.post(url, headers: headers, body: body);

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal attendance in ');
    }
  }
}
