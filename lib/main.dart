import 'package:carros/pages/splash_page.dart';
import 'package:flutter/material.dart';

import 'package:carros/pages/loginPage.dart';
import 'package:carros/pages/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carros',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        LoginPage.routeName: (ctx) => LoginPage(),
        HomePage.routeName: (ctx) => HomePage(),
      },
      home: SplashPage(),
    );
  }
}
