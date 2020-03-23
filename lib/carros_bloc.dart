import 'dart:async';

import 'package:carros/favoritos/carro_dao.dart';
import 'package:carros/utils/network.dart';

import 'model/carro.dart';
import 'package:carros/services/carros_api.dart';

class CarrosBloc {
    final _streamController = StreamController<List<Carro>>();
    Stream<List<Carro>> get stream => _streamController.stream;

    fetch(TipoCarro tipo) async {
      
    try{  

      bool networkOn = await isNetworkOn();

      if(!networkOn) {
        String t = tipo.toString().replaceAll('TipoCarro.', '');
        List<Carro> carros = await CarroDAO().findAllByTipo(t);
         _streamController.add(carros);
        return carros;
      }

      List<Carro> carros = await CarrosApi.getCarros(tipo);

      if(carros.isNotEmpty){
        final dao = CarroDAO();
        carros.forEach((c) => dao.save(c));
        //Sintaxe alternativa
        //carros.forEach(dao.save);  //Pega o parametro c e repassa automaticamente para o unico parametro da funcao save
      }
      
      _streamController.add(carros);

    } catch(e) {
      _streamController.addError(e);
    }

  }

  Future<List<Carro>>  willFetch(TipoCarro tipo) async {
      
    try{  
      List<Carro> carros = await CarrosApi.getCarros(tipo);
      _streamController.add(carros);
      return carros;
    } catch(e) {
      _streamController.addError(e);
    }

  }



  dispose(){
    _streamController.close();
  }
  
}