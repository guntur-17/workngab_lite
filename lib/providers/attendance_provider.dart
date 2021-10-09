import 'package:absen_lite/models/attendance_model.dart';
import 'package:absen_lite/services/attendance_service.dart';
// import 'package:absen_lite/models/user_model.dart';
// import 'package:absen_lite/services/auth_service.dart';
import 'package:flutter/widgets.dart';

class AttedanceProvider with ChangeNotifier {
  // AttendanceModel? _attendance;
  List<AttendanceModel> _attendances = [];

  List<AttendanceModel> get attendances => _attendances;

  set attendances(List<AttendanceModel> attendances) {
    _attendances = attendances;
    notifyListeners();
  }

  Future<void> getAttendances(String? token) async {
    try {
      List<AttendanceModel> attendances =
          await AttendanceService().getAttendances(token);
      _attendances = attendances;
    } catch (e) {
      print(e);
    }
  }

  // Future<bool> login({String? username, String? password}) async {
  //   try {
  //     UserModel user =
  //         await AuthService().login(username: username, password: password);
  //     _user = user;
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

}
