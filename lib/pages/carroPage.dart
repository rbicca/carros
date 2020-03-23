import 'package:cached_network_image/cached_network_image.dart';
import 'package:carros/services/lori_api.dart';
import 'package:flutter/material.dart';
import 'package:carros/model/carro.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CarroPage extends StatefulWidget {

  final Carro carro;

  CarroPage(this.carro);

  @override
  _CarroPageState createState() => _CarroPageState();
}

class _CarroPageState extends State<CarroPage> {

  final _loripsumApiBloc = LoripsumBloc();

  @override
  void initState() {
    super.initState();
    _loripsumApiBloc.fetch();
  }

  @override
  void dispose() {
    super.dispose();
    _loripsumApiBloc.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.carro.nome ?? '' ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.place), onPressed: _onClickMapa),
          IconButton(icon: Icon(Icons.videocam), onPressed: _onClickVideo),
          PopupMenuButton<String>(
            onSelected: (value) => _onClickMenu(value),
            itemBuilder: (ctx){
              return[
                PopupMenuItem(value: 'edt', child: Text('Editar'),),
                PopupMenuItem(value: 'del', child: Text('Apagar'),),
                PopupMenuItem(value: 'shr', child: Text('Compatilhar'),),
              ];
            },
          ),
                            ],
                          ),
      body: _body(),
      );
    }
                    
    _body() {
      if(widget.carro.urlFoto != null) {
        return ListView(
          children: <Widget>[
            CachedNetworkImage(imageUrl:widget.carro.urlFoto),
            _bloco1(),
            Divider(),
            _bloco2(),
          ],
        );
      } else {
        return Container();
      }
    }

    Row _bloco1() {
      return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.carro.nome, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                Text(widget.carro.tipo, style: TextStyle(fontSize: 14),),
              ],
            ),
            Row(children: <Widget>[
              IconButton(icon: Icon(Icons.favorite),  iconSize: 30, color: Colors.red, onPressed: _onClickFav),
              IconButton(icon: Icon(Icons.share), iconSize: 30, onPressed: _onClickShare),
            ],),
          ],);
    }

    _bloco2(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Text(widget.carro.descricao, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        SizedBox(height: 20,),
        
        StreamBuilder(
          stream: _loripsumApiBloc.stream,
          builder: (BuildContext ctx, AsyncSnapshot snapshot){
            if(!snapshot.hasData){ return Center(child: CircularProgressIndicator(),); }

            return Text(snapshot.data, style: TextStyle(fontSize: 16),);
          },
        )

      ],);
    } 

    void _onClickMapa() {
  
    }
    
    void _onClickVideo() {

    }

    void _onClickFav(){
      
    }

    void _onClickShare(){

    }

    void _onClickMenu(String value){
      switch (value) {
        case 'edt':
          
          break;
        case 'del':
          
          break;

        case 'shr':
          
          break;

        default:
      }
    }


}