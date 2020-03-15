import 'dart:async';
import 'package:http/http.dart' as http;

class LoripsumApi {

  static Future<String> getLoripsum() async {
    
    final url = 'https://loripsum.net/api';

    var response = await http.get(url);

    String text = response.body;
    text = text.replaceAll('<p>', '');
    text = text.replaceAll('</p>', '');

    return text;
  }

}

//Observar técnica de cache, que pode ser util 
class LoripsumBloc {
    final _streamController = StreamController<String>();
    Stream<String> get stream => _streamController.stream;
    static String lorim;

    fetch() async {
      
    try{  
      String ret  = lorim ?? await LoripsumApi.getLoripsum();
      lorim = ret;
      _streamController.add(ret);
    } catch(e) {
      _streamController.addError(e);
    }

  }

  dispose(){
    _streamController.close();
  }
  
}