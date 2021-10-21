import 'package:absen_lite/models/attendance_model.dart';
import 'package:absen_lite/services/attendance_service.dart';
// import 'package:absen_lite/models/user_model.dart';
// import 'package:absen_lite/services/auth_service.dart';
import 'package:flutter/widgets.dart';

class AttedanceProvider with ChangeNotifier {
  // AttendanceModel? _attendance;
  List<AttendanceModel> _attendances = [];

  List<AttendanceModel> get attendances => _attendances;
  // bool _checkConditionClock = true;

  // bool get checkConditionClock => _checkConditionClock;

  // set checkConditionClock(bool checkConditionClock) {
  //   _checkConditionClock = checkConditionClock;
  //   notifyListeners();
  // }

  set attendances(List<AttendanceModel> attendances) {
    _attendances = attendances;
    notifyListeners();
  }

  Future<bool> getAttendances(String? token) async {
    try {
      List<AttendanceModel> attendances =
          await AttendanceService().getAttendances(token);
      _attendances = attendances;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> attendanceIn(
    String? token,
    String? time,
    double? lat,
    double? long,
  ) async {
    try {
      if (await AttendanceService().attendanceIn(token, time, lat, long)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> attendanceOut(
    String? token,
    String? time,
    double? lat,
    double? long,
  ) async {
    try {
      if (await AttendanceService().attendanceOut(token, time, lat, long)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
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
