import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {

  final String label;
  final Function onPressed;

  AppButton(this.label, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Container(
          height: 46,
          child: RaisedButton(
            color: Colors.amber,
            child: Text(label, style: TextStyle(color: Colors.white, fontSize: 22),),  
            onPressed: onPressed,
          )
      );

  }

}