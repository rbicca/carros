import 'package:carros/carros_bloc.dart';
import 'package:carros/widgets/carros_listivew.dart';
import 'package:flutter/material.dart';
import 'package:carros/services/carros_api.dart';
import 'package:carros/model/carro.dart';

class CarrosPage extends StatefulWidget {
  final TipoCarro tipo;

  const CarrosPage(this.tipo);

  @override
  _CarrosPageState createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage>  with AutomaticKeepAliveClientMixin<CarrosPage> {

  final _bloc = CarrosBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _bloc.fetch(widget.tipo);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);


    return StreamBuilder(
      stream: _bloc.stream,
      builder: (ctx, snap){
        if(snap.hasError){
          return Center(
            child: Text('Não foi possível buscar os carros', style: TextStyle(color: Colors.red, fontSize: 22),),
          );
        }

        if(!snap.hasData){
          return Center(child: CircularProgressIndicator(),);
        }

        List<Carro> carros = snap.data;
        
        return RefreshIndicator(
          onRefresh: _onRefresh,  
                    child: CarrosListView(carros,)
          );
          
        });
      }
          
    Future<void> _onRefresh() {
      //return Future.delayed(Duration(seconds: 3), () => print('Agoia deu'));
      return _bloc.willFetch(widget.tipo);
    }

    @override
    void dispose() {
      super.dispose();
  
      _bloc.dispose();
    }
    

}