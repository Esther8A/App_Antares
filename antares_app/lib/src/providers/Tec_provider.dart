import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:antares_app/src/Models/userTec.dart';

class TecProvider {
  CollectionReference _ref;

  TecProvider() {
    _ref = FirebaseFirestore.instance.collection('Tec');
  }

  Future<void> create(UserTec userTec) {
    String errorMessage;
    try {
      return _ref.doc(userTec.id).set(userTec.toJson());
    } catch (error) {
      errorMessage = error.code;
    }
    if (errorMessage != null) {
      return Future.error(errorMessage);
    }
  }
}
