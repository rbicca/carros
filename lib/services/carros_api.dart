import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:carros/model/carro.dart';

class CarrosApi {
  
  static Future<List<Carro>> getCarros() async {
    //final carros = List<Carro>();
    
    // await Future.delayed(Duration(seconds: 2));
    // carros.add(Carro(nome: 'BMW X7', urlFoto: 'https://s2.glbimg.com/WyUzkyRtVxqI_AgIf49M4iOT-eo=/620x413/e.glbimg.com/og/ed/f/original/2019/01/28/novo-bmw-x5.jpg'));
    // carros.add(Carro(nome: 'Land Rover Range Rover Sport', urlFoto: 'https://i.ytimg.com/vi/VJY37MjiHfo/maxresdefault.jpg'));
    // carros.add(Carro(nome: 'Audi Q8', urlFoto: 'https://revistacarro.com.br/wp-content/uploads/2019/10/Audi-Q8_3.jpg'));


    final url = 'http://carros-springboot.herokuapp.com/api/v1/carros';
    final response = await http.get(url);
    final List dados = jsonDecode(response.body);
    
    return dados.map<Carro>((c) => Carro.fromJson(c)).toList();

  }

}