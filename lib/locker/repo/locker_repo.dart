import '../../services/data.dart';
import '../model/locker_model.dart';

class LockerRepositry {
  Future getLockerContent() async {
    try {
      var response = await getData('assets/data/lockerData.json');
      final lockerModel = lockerModelFromJson(response);
      return lockerModel;
    } catch (e) {
      throw UnknownException();
    }
  }
}

class UnknownException implements Exception {}
