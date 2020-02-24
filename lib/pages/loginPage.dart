import 'package:carros/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:carros/widgets/app_text.dart';
import 'package:carros/widgets/app_button.dart';

class LoginPage extends StatefulWidget {
   static const routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 
  final _formKey = GlobalKey<FormState>();
  final _ctrlLogin = TextEditingController();
  final _ctrlSenha = TextEditingController();
  final _focusSenha = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carros')),
      body: _body(),
    );
  }

  _body(){
    return Form(
    key: _formKey,
          child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            AppText('Login', 'Informe o login', controller: _ctrlLogin, validator: _validateLogin, keyboardType: TextInputType.emailAddress, textInputAction: TextInputAction.next, nextFocus: _focusSenha),
            SizedBox(height: 10),
            AppText('Senha', 'Informe a senha', controller: _ctrlSenha, validator: _validateSenha , keyboardType: TextInputType.number,  obscure: true, focusNode: _focusSenha),
            SizedBox(height: 20),
            AppButton('Login', onPressed: _onLoginClick),
          ],
        ),),
      ); 
  }

  _onLoginClick() {
      if(!_formKey.currentState.validate()) { return; }
      Navigator.of(context).pushNamed(HomePage.routeName);
  }

  String _validateLogin(String text) {
    if(text.isEmpty){
      return 'Informe o login';
    }
    return null;
  }

  String _validateSenha(String text) {
    if(text.isEmpty){
      return 'Informe a senha';
    }
    if(text.length < 3){
      return 'A senha precisa ter pelo menos 3 caracteres';
    }
    return null;
  }

} 