import 'package:antares_app/src/utils/my_progress_dialog.dart';
import 'package:antares_app/src/utils/snackbar.dart ' as utils;
import 'package:antares_app/src/Models/userTec.dart';
import 'package:antares_app/src/providers/Tec_provider.dart';
import 'package:antares_app/src/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class RegisterControler {
  BuildContext context;
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  TextEditingController userController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwController = TextEditingController();
  TextEditingController confirmPasswController = TextEditingController();

  AuthProvider _authProvider;
  TecProvider _tecProvider;
  ProgressDialog _progressDialog;

  Future init(BuildContext context) {
    this.context = context;
    _authProvider = new AuthProvider();
    _tecProvider = new TecProvider();
    _progressDialog = MyProgressDialog.createProgressDialog(context,'Espere un momento...');

  }

  void goToRegisterPage() {
    Navigator.pushNamed(context, 'Register');
  }

  void register() async {
    String email = userController.text.trim();
    String password = passwController.text.trim();
    String userName = userNameController.text;
    String confirmpassword = confirmPasswController.text.trim();

    print('Usuario: $email');
    print('Password: $password');
    if (userName.isEmpty &&
        email.isEmpty &&
        password.isEmpty &&
        confirmpassword.isEmpty) {
      print('El usuario debe ingresar todos los datos');
      utils.Snackbar.showSnackbar(context, key,'El usuario debe ingresar todos los datos');
      return;
    }

    if (confirmpassword != password) {
      print('Las contraseñas no coinciden');
      utils.Snackbar.showSnackbar(context, key,'Las contraseñas no coinciden');
      return;
    }

    if (password.length < 6) {
      print('La contraseña debe tener al menos 6 caracteres');
      utils.Snackbar.showSnackbar(context, key,'La contraseña debe tener al menos 6 caracteres');
      return;
    }
    _progressDialog.show();
    try {
      bool isRegister = await _authProvider.Register(email, password);

      if (isRegister) {
        UserTec userTec = new UserTec(
          id: _authProvider.getUser().uid,
          email: _authProvider.getUser().email,
          username:  userName,
          password: password
        );
        await _tecProvider.create(userTec);
        _progressDialog.hide();
        utils.Snackbar.showSnackbar(context, key,'El usuario se registró correctamente');
        print('El usuario se registró correctamente');
      } else {
        _progressDialog.hide();
        print("El usuario no se pudo registrar");
      }
    } catch (error) {
      _progressDialog.hide();
      utils.Snackbar.showSnackbar(context, key,'Error: $error');
      print('Error: $error');
    }
  }
}
