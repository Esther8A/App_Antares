import 'package:antares_app/src/providers/auth_providers.dart';
import 'package:antares_app/src/utils/my_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:antares_app/src/utils/snackbar.dart ' as utils;

class LoginControler {
  BuildContext context;
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  TextEditingController userController = TextEditingController();
  TextEditingController passwController = TextEditingController();
  AuthProvider _authProvider;
  ProgressDialog _progressDialog;

  Future init(BuildContext context) {
    this.context = context;
    _authProvider = new AuthProvider();
    _progressDialog = _progressDialog = MyProgressDialog.createProgressDialog(context,'Espere un momento...');
  }
  void goToRegisterPage(){
    Navigator.pushNamed(context, 'Register');
  }

  void login() async {
    String email = userController.text.trim();
    String password = passwController.text.trim();
    print('Usuario: $email');
    print('Password: $password');
    _progressDialog.show();

    try {
      bool isLogin = await _authProvider.Login(email, password);
      _progressDialog.hide();

    if (isLogin){
      print('El suario esta logeado');
      utils.Snackbar.showSnackbar(context, key,'El usuario esta logeado');
    }
    else{
      utils.Snackbar.showSnackbar(context, key,'El usuario no se pudo autenticar');
      _progressDialog.hide();
      print('El usuario no se pudo autenticar');
    }
    } catch (error) {
      utils.Snackbar.showSnackbar(context, key,'Error: $error');
      _progressDialog.hide();
      print('Error: $error');
    }
  }
}
