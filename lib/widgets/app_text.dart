import 'package:flutter/material.dart';

class AppText extends StatelessWidget {

  final String label;
  final String hint;
  final bool obscure;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final FocusNode nextFocus;

  AppText(this.label, this.hint, { this.obscure = false , this.controller, this.validator, this.keyboardType, this.textInputAction, this.focusNode, this.nextFocus});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
          validator: validator,
          controller: controller,
          obscureText: obscure,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          focusNode: focusNode,
          style: TextStyle(fontSize: 22, color: Colors.blue,),
          decoration: InputDecoration(
            labelText: label, 
            labelStyle: TextStyle(fontSize: 16, color: Colors.grey,),
            hintText: hint,
            hintStyle: TextStyle(fontSize: 16,),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
          ),
          onFieldSubmitted: (String text){
            if(nextFocus != null){ 
              FocusScope.of(context).requestFocus(nextFocus);
            }
          },
        );
  }
}