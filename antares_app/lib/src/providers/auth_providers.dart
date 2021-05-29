import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider {
  FirebaseAuth _firebaseAuth;

  AuthProvider() {
    _firebaseAuth = FirebaseAuth.instance;
  }
User getUser (){
    return _firebaseAuth.currentUser;
}
  Future<bool> Login(String email, String password) async {
    String errorMessage;
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (error) {
      print(error);
      errorMessage = error.code;
    }
    if (errorMessage != null) {
      return Future.error(errorMessage);
    }
      return true;
    }

  Future<bool> Register(String email, String password) async {
    String errorMessage;
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (error) {
      print(error);
      errorMessage = error.code;
    }
    if (errorMessage != null) {
      return Future.error(errorMessage);
    }
    return true;
  }
  }

