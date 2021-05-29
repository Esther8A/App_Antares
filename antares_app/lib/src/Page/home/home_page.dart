//import 'dart:js';
import 'package:antares_app/src/Page/home/home_controler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class HomePage extends StatelessWidget {
  HomeControler _con = new HomeControler();

  @override
  Widget build(BuildContext context) {
    _con.init(context); //inicializar maestro controlador
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black, Colors.blueGrey])),
          child: Column(
            children: [
              _bannerApp(context),
              SizedBox(
                height: 50,
              ),
              _textSelectYourRol(),
              SizedBox(
                height: 50,
              ),
              _imageTypeUser(context, 'assets/img/cabeza.png'),
              SizedBox(
                height: 10,
              ),
              _textTypeUser('Admin'),
              SizedBox(
                height: 30,
              ),
              _imageTypeUser(context, 'assets/img/soporte-tecnico.png'),
              SizedBox(
                height: 10,
              ),
              _textTypeUser('Técnico')
            ],
          ),
        ),
      ),
    );
  }

  Widget _bannerApp(BuildContext context) {
    return ClipPath(
      clipper: DiagonalPathClipperTwo(),
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/img/1.jpeg',
              width: 150,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget _textSelectYourRol() {
    return Text(
      'SELECCIONA TU ROL',
      style: TextStyle(color: Colors.white),
    );
  }

  Widget _imageTypeUser(BuildContext context, String image) {
    return GestureDetector(
      onTap: _con.goToLoginPage,
      child: CircleAvatar(
        backgroundImage: AssetImage(image),
        radius: 50,
        backgroundColor: Colors.grey[900],
      ),
    );
  }

  Widget _textTypeUser(String typeUser) {
    return Text(
      typeUser,
      style: TextStyle(color: Colors.white),
    );
  }
}
