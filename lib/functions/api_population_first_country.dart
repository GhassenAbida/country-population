// this function is used to get the populationsCounts (population/year)
// with an integer as index

import 'package:http/http.dart' as http;
import 'dart:convert';
class ApiPop  {
  static Future<List<dynamic>>? getData(  int i) async {
    var url = Uri.parse('https://countriesnow.space/api/v0.1/countries/population/cities');
    http.Response response=await http.get(url);
    List<dynamic>? list;
    if (response.statusCode == 200) {
      //  print(response.body);
      var data = json.decode(response.body);
      list=data['data'];
      List<dynamic>? pop;
        pop=list![i]["populationCounts"];
      return(pop!);
    } else
      Exception("Erreur de chargement des données");
    return(list!);
  }
}
