import 'dart:async';

import 'model/carro.dart';
import 'package:carros/services/carros_api.dart';

class CarrosBloc {
    final _streamController = StreamController<List<Carro>>();
    Stream<List<Carro>> get stream => _streamController.stream;

    fetch(TipoCarro tipo) async {
      
    try{  
      List<Carro> carros = await CarrosApi.getCarros(tipo);
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