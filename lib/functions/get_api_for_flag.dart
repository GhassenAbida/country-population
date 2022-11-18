
//this function is used to get the list of names and id code of flags
import 'package:http/http.dart' as http;
import 'dart:convert';
class Api  {
  static Future<List<dynamic>>? getData() async {
    var url = Uri.parse('https://countriesnow.space/api/v0.1/countries/flag/images');
    http.Response response=await http.get(url);
    List<dynamic>? list;
    if (response.statusCode == 200) {
      //  print(response.body);
      var data = json.decode(response.body);
      list=data['data'];
      return(list!);
    } else
      Exception("Erreur de chargement des données");
    return(list!);
  }
}
