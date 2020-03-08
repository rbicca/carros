import 'dart:async';

import 'package:carros/services/api_response.dart';
import 'package:carros/services/login_api.dart';
import 'model/usuario.dart';

class LoginBloc {
  final _streamController = StreamController<bool>();
  get stream => _streamController.stream;
  
  Future<ApiResponse<Usuario>> login(String login, String senha) async {
    _streamController.sink.add(true);
    ApiResponse response = await LoginApi.login(login, senha);
    _streamController.sink.add(false);
    return response;
  }

  void dipose(){
    _streamController.close();
  }

}