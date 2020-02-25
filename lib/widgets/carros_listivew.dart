import 'package:flutter/material.dart';
import 'package:carros/model/carro.dart';
import 'package:carros/services/carros_api.dart';

class CarrosListView extends StatefulWidget {
  final TipoCarro tipo;

  const CarrosListView(this.tipo);

  @override
  _CarrosListViewState createState() => _CarrosListViewState();
}

class _CarrosListViewState extends State<CarrosListView>  with AutomaticKeepAliveClientMixin<CarrosListView> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _body();
  }

    _body() {

    Future<List<Carro>> futureCarros = CarrosApi.getCarros(widget.tipo);

    return FutureBuilder(
      future: futureCarros,
      builder: (context, snapshot) {

        if(snapshot.hasError) { return Center(child: Text('Erro ao buscar os carros', style: TextStyle(color: Colors.red),),); }

        if(!snapshot.hasData) { return Center(child: CircularProgressIndicator(),); }

        List<Carro> carros = snapshot.data;
        return _listView(carros);
      },
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
                      FlatButton(onPressed: (){}, child: Text('Detalhes'),),
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

}