//import 'dart:html';

import 'package:antares_app/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class HomeControler {
  BuildContext context;
  SharedPref _sharedPref;

  Future init(BuildContext context) {
    this.context = context;
    _sharedPref = new SharedPref();
  }

  void goToLoginPage() {
    Navigator.pushNamed(context, 'Login');
  }
  void saveTypeUserTec()async{
    await _sharedPref.save('typeUser', 'client');
  }
  void saveTypeUserAdmin()async{
    await _sharedPref.save('typeUser', 'Admin');
  }
}
