// model of populations , I added a function called filter to extract population value
// and year of a chosen country

class AutoGenerate {
  AutoGenerate({
    required this.error,
    required this.msg,
    required this.data,
  });

  late final bool error;
  late final String msg;
  late final List<Data> data;

  AutoGenerate.fromJson(Map<String, dynamic> json){
    error = json['error'];
    msg = json['msg'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }
  // This filter returns with a given name their population value and year in each index
  // this is the main function that let you build your cards when a country is chosen
   List <PopulationCounts> filter(String name) {
     List <PopulationCounts> temp= <PopulationCounts>[] ;
   for(var entry in data.where((i) => i.country==name).toList()) {
     for(var element in entry.populationCounts){
       temp.add(element);}}
     return (temp);}

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['error'] = error;
    _data['msg'] = msg;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.city,
    required this.country,
    required this.populationCounts,
  });

  late final String city;
  late final String country;
  late final List<PopulationCounts> populationCounts;

  Data.fromJson(Map<String, dynamic> json){
    city = json['city'];
    country = json['country'];
    populationCounts = List.from(json['populationCounts']).map((e) =>
        PopulationCounts.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['city'] = city;
    _data['country'] = country;
    _data['populationCounts'] =
        populationCounts.map((e) => e.toJson()).toList();
    return _data;
  }
}

class PopulationCounts {
  PopulationCounts({
    required this.year,
    required this.value,
    this.sex,
    this.reliabilty,
  });
  late final String year;
  late final String? value;
  late final String? sex;
  late final String? reliabilty;

  PopulationCounts.fromJson(Map<String, dynamic> json){
    year = json['year'];
    value = json['value'] !=null ? json['value'] : null ;
    sex = null;
    reliabilty = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['year'] = year;
    _data['value'] = value;
    _data['sex'] = sex;
    _data['reliabilty'] = reliabilty;
    return _data;
  }
}