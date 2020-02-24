import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {

  final String label;
  final Function onPressed;
  final bool isLoading;

  AppButton(this.label, {this.onPressed, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
        return Container(
            height: 46,
            child: RaisedButton(
              color: Colors.amber,
              child: isLoading
                  ? Center(child: CircularProgressIndicator( valueColor: AlwaysStoppedAnimation<Color>(Colors.white),),)
                  : Text(label, style: TextStyle(color: Colors.white, fontSize: 22,),),
              onPressed: onPressed,
            ),
          );
  }

}