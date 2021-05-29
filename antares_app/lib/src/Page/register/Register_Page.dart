import 'package:antares_app/src/Page/register/Register_Controler.dart';
import 'package:antares_app/src/widget/button.app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterControler _con = new RegisterControler();

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
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            _textUserName(),
            _textGmail(),
            _textPassword(),
            _textPasswordConfirm(),
            _ButtonRegister(),
          ],
        ),
      ),
    );
  }

  Widget _textGmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: TextField(
        controller: _con.userController,
        decoration: InputDecoration(
          hintText: 'Prueba@TGS',
          labelText: 'Correo Electronico',
          suffixIcon: Icon(
            Icons.email_outlined,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _textUserName() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: TextField(
        controller: _con.userNameController,
        decoration: InputDecoration(
          hintText: 'Prueba.TGS',
          labelText: 'Nombre de usuario',
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

  Widget _textPasswordConfirm() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: TextField(
        controller: _con.confirmPasswController,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Confirmar contraseña',
          suffixIcon: Icon(
            Icons.lock_open_outlined,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _ButtonRegister() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 100, vertical: 22),
      child: ButtonApp(onPressed: _con.register,
          text: 'REGISTRAR'
      ),
    );
  }

  Widget _textDescription() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        'REGISTRO',
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
        height: MediaQuery.of(context).size.height * 0.15,
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
