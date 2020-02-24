import 'package:carros/widgets/drawer_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carros')),
      drawer: DrawerList(),
      body: _body(),
    );
  }


  _body(){
    return Center(
      child: Text('The Carros Project', style: TextStyle(fontSize: 22),),
    );
  }

}