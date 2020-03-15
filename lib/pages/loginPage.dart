import 'dart:async';

import 'package:carros/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:carros/pages/homePage.dart';
import 'package:carros/widgets/app_text.dart';
import 'package:carros/widgets/app_button.dart';
import 'package:carros/services/api_response.dart';
import 'package:carros/model/usuario.dart';
import 'package:carros/utils/alert.dart';

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

  //var _isLoading = false;
  final _bloc = LoginBloc();
  

  @override
  void initState() {
    super.initState();

    Future<Usuario> futureUsuario = Usuario.get();
    futureUsuario.then((Usuario user){
      if(user != null){
        //Login automático
         Navigator.of(context).pushReplacementNamed(HomePage.routeName);
        // setState(() {
        //   _ctrlLogin.text = user.login;  
        // });
      }
    });

  }

  @override
  void dispose() {
    super.dispose();

    _bloc.dipose();
  }

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
            StreamBuilder<bool>(
              stream: _bloc.stream,
              initialData: false,
              builder: (ctx, snapshot){ return AppButton('Login', onPressed: _onLoginClick, isLoading: snapshot.data ?? false,); },
            ),
          ],
        ),),
      ); 
  }

  _onLoginClick() async {
      if(!_formKey.currentState.validate()) { return; }

      String login = _ctrlLogin.text;
      String senha = _ctrlSenha.text;

      // setState(() {
      //   _isLoading = true;
      // });
      
      ApiResponse response = await _bloc.login(login, senha);

      // setState(() {
      //   _isLoading = false;
      // });
       

      if(response.ok) {
        Usuario user = response.result;
        print('logou como $user');
        Navigator.of(context).pushReplacementNamed(HomePage.routeName);
      } else {
        alert(context, response.msg);
      }
      
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