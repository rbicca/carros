import 'package:carros/model/usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:carros/model/carro.dart';

class CarrosApi {
  
  static Future<List<Carro>> getCarros(TipoCarro tipo) async {
    //final carros = List<Carro>();
    
    // await Future.delayed(Duration(seconds: 2));
    // carros.add(Carro(nome: 'BMW X7', urlFoto: 'https://s2.glbimg.com/WyUzkyRtVxqI_AgIf49M4iOT-eo=/620x413/e.glbimg.com/og/ed/f/original/2019/01/28/novo-bmw-x5.jpg'));
    // carros.add(Carro(nome: 'Land Rover Range Rover Sport', urlFoto: 'https://i.ytimg.com/vi/VJY37MjiHfo/maxresdefault.jpg'));
    // carros.add(Carro(nome: 'Audi Q8', urlFoto: 'https://revistacarro.com.br/wp-content/uploads/2019/10/Audi-Q8_3.jpg'));

    //Gambiarra
    String t = tipo.toString().replaceAll('TipoCarro.', '');

    Usuario user = await Usuario.get();

    //final url = 'http://carros-springboot.herokuapp.com/api/v1/carros';
    final url = 'https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$t';

    final headers = {
      "Content-Type" : "application/json",
      "Authorization" : "Bearer ${user.token}"
    };

    final response = await http.get(url, headers: headers);
    final List dados = jsonDecode(response.body);
    final carros = dados.map<Carro>((c) => Carro.fromMap(c)).toList();
    
    return carros;

  }

}

enum TipoCarro {
  classicos,
  esportivos,
  luxo
}