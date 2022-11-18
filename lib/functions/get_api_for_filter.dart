
//this function is for a filter created in populationModel that will extract the data
// of a given country and returns year/value Map.

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lovester/model/populationModel.dart';
class ApiPopF  {
  static Future<AutoGenerate> getData(  ) async {
    AutoGenerate? auto;
    var url = Uri.parse('https://countriesnow.space/api/v0.1/countries/population/cities');
    http.Response response=await http.get(url);
    if (response.statusCode == 200) {
      //  print(response.body);
      var data = json.decode(response.body);
      return(AutoGenerate.fromJson(data));
    } else
      Exception("Erreur de chargement des données");
   return(auto!);
  }
  }

