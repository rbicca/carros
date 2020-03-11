import 'package:carros/model/carros_model.dart';
import 'package:flutter/material.dart';
import 'package:carros/pages/carroPage.dart';
import 'package:carros/services/carros_api.dart';
import 'package:carros/model/carro.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CarrosListView extends StatefulWidget {
  final TipoCarro tipo;

  const CarrosListView(this.tipo);

  @override
  _CarrosListViewState createState() => _CarrosListViewState();
}

class _CarrosListViewState extends State<CarrosListView>  with AutomaticKeepAliveClientMixin<CarrosListView> {

  final _model = CarrosModel();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _model.fetch(widget.tipo);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);


    return Observer(
      builder: (_){
        List<Carro> carros = _model.carros;

        if(_model.error != null){
          return Center(
            child: Text('Não foi possível buscar os carros', style: TextStyle(color: Colors.red, fontSize: 22),),
          );
        }

        if(carros == null){
          return Center(child: CircularProgressIndicator(),);
        }
        
        return _listView(carros);

      }
    );
  
  }


  Padding _listView(List<Carro> carros) {
    return Padding(
    padding: const EdgeInsets.all(16.0),
    child: ListView.builder(
      itemCount: carros!= null ?  carros.length : 0,
      itemBuilder: (ctx, i){
        Carro c = carros[i];

        // return Row(children: <Widget>[
        //   Image.network(c.urlFoto, width: 150,),
        //   Flexible(
        //     child: Text(c.nome,  maxLines: 1,  overflow: TextOverflow.ellipsis,  style: TextStyle(fontSize: 22),)
        //   ),
        // ],);

        return Card(
          color: Colors.grey[100],
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(child: Image.network(c.urlFoto, width: 250,)),
                Text(c.nome,  maxLines: 1,  overflow: TextOverflow.ellipsis,  style: TextStyle(fontSize: 22),),
                Text('descrição...',  maxLines: 1,  overflow: TextOverflow.ellipsis,  style: TextStyle(fontSize: 14),),
                ButtonBarTheme(
                  data: ButtonBarTheme.of(ctx),
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(onPressed:() => _onClickCarro(ctx, c) , child: Text('Detalhes'),),
                      FlatButton(onPressed: (){}, child: Text('Share'),),
                    ],
                  ),
                )
            ],),
          ),
        );

    }),
  );
  }

  _onClickCarro(ctx, Carro c) {
    Navigator.push(ctx, MaterialPageRoute(builder: (ctx) => CarroPage(c)));
  }

}