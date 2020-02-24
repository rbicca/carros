import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carros')),
      body: _body(),
    );
  }


  _body(){
    return Center(
      child: Text('The Carros Project', style: TextStyle(fontSize: 22),),
    );
  }

}