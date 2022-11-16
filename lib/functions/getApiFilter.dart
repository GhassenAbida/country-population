import 'package:http/http.dart' as http;
import 'dart:convert';
class ApiPopF  {

  static Future<List<dynamic>>? getData(  ) async {
    int i=0;
    var url = Uri.parse('https://countriesnow.space/api/v0.1/countries/population/cities');
    http.Response response=await http.get(url);
    List<dynamic>? list;
    if (response.statusCode == 200) {
      //  print(response.body);
      var data = json.decode(response.body);
      list=data['data'];

      List<dynamic>? pop;
      /*while (list![0]["populationCounts"][j]["value"]!=null){

      print(list![i]["populationCounts"][j]["value"]);
      j=j+1;
      if (list![i]["populationCounts"][j+1]["value"]==null){
        Exception("erreur d'index");
      };

      };
      print(list![0]["country"]);
      /*while(list![i]["country"]!=null) {
        if (list[i]["country"]=="Algeria"){print(list[i]["populationCounts"]);
        i++;};
      }*/*/




      pop=list![i]["populationCounts"];



      print(pop);
      return(list);
    } else
      Exception("Erreur de chargement des données");
    return(list!);
  }
}
