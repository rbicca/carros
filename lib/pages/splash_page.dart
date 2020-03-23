import 'package:carros/utils/sql/db_helper.dart';
import 'package:flutter/material.dart';
import 'loginPage.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();

    Future future1 = DatabaseHelper.getInstance().db;

    Future future2 = Future.delayed(Duration(seconds: 5));

    Future.wait([future1, future2]).then((List values){
      //Neste array, values, temos o resultado de retorno de cada um dos futures
      //values[0], values[1]... etc
      //print(values);
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
      
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[200],
      child: Center(child: CircularProgressIndicator(),),      
    );
  }
}