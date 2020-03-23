import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carros/pages/carroPage.dart';
import 'package:carros/model/carro.dart';

class CarrosListView extends StatelessWidget{

  final List<Carro> carros;
  
  CarrosListView(this.carros);

  @override
  Widget build(BuildContext context){
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: carros!= null ?  carros.length : 0,
          itemBuilder: (ctx, i){
            Carro c = carros[i];

            return Card(
              color: Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(child: CachedNetworkImage(imageUrl: c.urlFoto, width: 250,)),
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