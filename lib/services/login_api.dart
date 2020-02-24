import 'package:carros/services/api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:carros/model/usuario.dart';

class LoginApi {

  static Future<ApiResponse<Usuario>> login(String login, String senha) async {

    var url = 'http://carros-springboot.herokuapp.com/api/v2/login';

    final headers = {
      "Content-Type" : "application/json"
    };

    final params = {
	          "username": login,
	          "password": senha
    };

    try {
      var response = await http.post(url, body: jsonEncode(params), headers: headers);

      //print('Response status: ${response.statusCode}');
      //print('Response body: ${response.body}');

      final dados = jsonDecode(response.body);

      if(response.statusCode == 200){
        final user = Usuario.fromJson(dados);
        return ApiResponse.ok(user);
      } else {
        return ApiResponse.error(response.statusCode, dados['error']);
      }

    } catch (error, exception){
      print('Erro na chamada login $error > $exception');
      return(ApiResponse.error(-1, 'Erro na chamada login'));

    }

    
  }

}