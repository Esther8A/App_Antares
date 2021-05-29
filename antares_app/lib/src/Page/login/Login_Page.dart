import 'package:antares_app/src/Page/login/Login_Controler.dart';
import 'package:antares_app/src/widget/button.app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginControler _con = new LoginControler();

  @override
  void initState() {
    super.initState();
    print('Init State');
    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.key,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _bannerApp(),
            _textDescription(),
            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * 0.17),
            _textGmail(),
            _textPassword(),
            _ButtonLogin(),
            _TextRegister()
          ],
        ),
      ),
    );
  }

  Widget _textGmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: TextField(
        controller: _con.userController,
        decoration: InputDecoration(
          hintText: 'Prueba@tsg',
          labelText: 'Correo Electronico',
          suffixIcon: Icon(
            Icons.account_circle_outlined,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }


  Widget _textPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: TextField(
        controller: _con.passwController,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Contraseña',
          suffixIcon: Icon(
            Icons.lock_open_outlined,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _TextRegister() {
    return GestureDetector(
      onTap: _con.goToRegisterPage,
      child: Container(
        margin: EdgeInsets.only(bottom: 230),
        child: Text(
          '¿No tienes cuenta?',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _ButtonLogin() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 100, vertical: 22),
      child: ButtonApp(
          onPressed: _con.login,
          text: 'Iniciar sesión'),

    );
  }

  Widget _textDescription() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        'INICIAR SESIÓN',
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: 'Roboto'),
      ),
    );
  }

  Widget _bannerApp() {
    return ClipPath(
      clipper: WaveClipperTwo(),
      child: Container(
        color: Colors.blueGrey,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.15,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/img/1.jpeg',
              width: 150,
              height: 75,
            ),
          ],
        ),
      ),
    );
  }
}
