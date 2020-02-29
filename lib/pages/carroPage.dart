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
      appBar: AppBar(title: Text(widget.carro.nome ?? '' ),),
      body: _body(),
    );
  }

  _body() {
    if(widget.carro.urlFoto != null) {
      return Image.network(widget.carro.urlFoto);
    } else {
      return Container();
    }
  }
}