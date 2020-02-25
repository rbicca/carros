import 'package:flutter/material.dart';
import 'package:carros/widgets/drawer_list.dart';
import 'package:carros/services/carros_api.dart';
import 'package:carros/model/carro.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carros')),
      drawer: DrawerList(),
      body: _body(),
    );
  }


  _body() {

    Future<List<Carro>> futureCarros = CarrosApi.getCarros();

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