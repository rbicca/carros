import 'package:carros/favoritos/favorito_dao.dart';
import 'package:carros/model/carro.dart';
import 'package:carros/model/favorito.dart';

class FavoritoService {
  static favoritar(Carro c) async {
    Favorito f = Favorito(id: c.id, nome: c.nome);
    
    final dao = FavoritoDAO();

    final exists = await dao.exists(c.id);
    if (exists){
      dao.delete(c.id);
    } else {
      dao.save(f);
    }
    
  }
}