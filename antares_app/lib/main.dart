import 'package:antares_app/src/Page/home/home_page.dart';
import 'package:antares_app/src/Page/login/Login_Page.dart';
import 'package:antares_app/src/Page/register/Register_Page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Antares',
      initialRoute: 'home',
      theme: ThemeData(
          fontFamily: 'Roboto',
          appBarTheme: AppBarTheme(elevation: 0
          ),
          primaryColor: Colors.blueGrey
      ),
      routes: {
        'home': (BuildContext context) => HomePage(),
        'Login': (BuildContext context) => LoginPage(),
        'Register': (BuildContext context) => RegisterPage(),
      },
    );
  }
}
