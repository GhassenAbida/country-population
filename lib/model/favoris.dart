// this model is created for the 4 properties of a card : Pop/year/name/idFlag .the functions are  fromJson
//  toJson addTo and remove are used in SharedPreferences to manipulate easily your cards marked as favourites.
class Favoris {
  String? name;
  String? idFlag;
  String? pop;
  String? year;

  Favoris({this.name, this.idFlag, this.pop, this.year});

  Favoris.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    idFlag = json['idFlag'];
    pop = json['pop'];
    year = json['year'];
  }
  // checks if a card is already in the list of cards , if not it will be added
  List <Favoris> addTo(List <Favoris> list){
    if(list.where((i)=>this.pop==i.pop&&this.idFlag==i.idFlag&&this.name==i.name&&this.year==i.year).toList().isEmpty){
       list.add(this);}
    return list;}
  // Removes a card if there was already a similar card in favs
  List <Favoris> remove(List <Favoris> list){
    list.removeWhere((element) => element.name==this.name&&element.idFlag==this.idFlag&&element.year==this.year&&element.pop==this.pop);
    return list;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['idFlag'] = this.idFlag;
    data['pop'] = this.pop;
    data['year'] = this.year;
    return data;
  }
}