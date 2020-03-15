import 'package:flutter/material.dart';
import 'package:carros/model/carro.dart';

class CarroPage extends StatefulWidget {

  final Carro carro;

  CarroPage(this.carro);

  @override
  _CarroPageState createState() => _CarroPageState();
}

class _CarroPageState extends State<CarroPage> {

  @override
  void initState() {
    super.initState();
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
            Image.network(widget.carro.urlFoto),
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
                Text(widget.carro.nome, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text(widget.carro.tipo, style: TextStyle(fontSize: 16),),
              ],
            ),
            Row(children: <Widget>[
              IconButton(icon: Icon(Icons.favorite),  iconSize: 40, color: Colors.red, onPressed: _onClickFav),
              IconButton(icon: Icon(Icons.share), iconSize: 40, onPressed: _onClickShare),
            ],),
          ],);
    }

    _bloco2(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Text(widget.carro.descricao, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        SizedBox(height: 20,),
        Text('loren ipsun', style: TextStyle(fontSize: 16),),
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