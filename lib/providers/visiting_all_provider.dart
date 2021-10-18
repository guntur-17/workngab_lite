import 'package:absen_lite/models/visiting_all_model.dart';
import 'package:absen_lite/services/visisting_all_service.dart';
import 'package:flutter/widgets.dart';

class VisitingAllProvider with ChangeNotifier {
  List<VisistingAllModel> _showAll = [];

  List<VisistingAllModel> get showAll => _showAll;

  set showAll(List<VisistingAllModel> showAll) {
    _showAll = showAll;
    notifyListeners();
  }

  Future<bool> getAllVisit(
    String? token,
    // int? id,
  ) async {
    try {
      List<VisistingAllModel> showAll =
          await VisitingAllService().getAllVisit(token: token);
      _showAll = showAll;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
