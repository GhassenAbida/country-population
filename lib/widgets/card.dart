
// this is the main card widget that is used in home and fav screen
// it takes 4 params
// on long pressed the bord color will be become yellow and an icon will appear
// when you click on it the bord comes back grey.
import 'package:flutter/material.dart';
import 'package:flag/flag.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lovester/model/favoris.dart';
import 'dart:convert';
class Carte extends StatefulWidget {
  const Carte( {Key? key,required this.name,required this.idFlag,required this.pop,required this.year,required this.bool}):super(key: key);
final dynamic name;
final dynamic idFlag;
final dynamic pop;
  final dynamic year;
  final String  bool;
  static int count=0;
  @override
  State<Carte> createState() => _CarteState();
}
class _CarteState extends State<Carte> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
// this function builds the list of your sharedPrefernces
  void updateFavoris(String name, idFlag, year, pop) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (Carte.count == 0) {
      Favoris fav = Favoris(name: name, idFlag: idFlag, pop: pop, year: year);
      List <Favoris> list = [fav];
      String content = jsonEncode(list);
      preferences.setString("list", content);
      Carte.count++;
    } else {
      String? content = preferences.getString("list");
      var list = json.decode(content!);
      List <Favoris> actualList = [];
      for (var temp in list) {
        actualList.add(Favoris.fromJson(temp));
      }
      Favoris element =Favoris(name: name, idFlag: idFlag, pop: pop, year: year);
      actualList=element.addTo(actualList);
      preferences.setString("list", jsonEncode(actualList));
      Carte.count=actualList.length;
    }
  }
  late String ids;
  final activeColor = Colors.grey;
  final inactiveColor = Colors.yellow;
  String test = "true";
  Carte? carte;
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    var height = size.height;
    // var width = size.width;
    return (
        Card(
          color: Colors.white60,
          shape: BeveledRectangleBorder(
            side: BorderSide(
              color: widget.bool == test ? activeColor : inactiveColor,
              width: 3,
            ),
          ),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {},
            onLongPress: () {
              updateFavoris(
                  widget.name, widget.idFlag, widget.year, widget.pop);
              isSelected = false;
              test = "false";
              setState(() {});
            },
            child:
            Column(
              children: [
                SizedBox(
                  height: height * 3 / 12.5,
                  width: 250,
                  child: Column(
                    children: [ Row(
                      children: [
                        SizedBox(width: 10, height: height / 40), ClipRRect(
                          borderRadius: BorderRadius.circular(10.0), //or 15.0
                          child: Container(
                            height: height * 2 / 24,
                            width: 55,
                            child: Flag.fromString(
                              widget.idFlag,
                              height: height / 9,
                              width: 80,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(widget.name,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                      ],),
                      SizedBox(height: height * 2 / 85),
                      const Text("Populations", style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(widget.pop, style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: height * 2 / 160),
                      Row(
                        children: [
                          widget.bool != test ? IconButton(onPressed: () async{
                            //this is needed to check if a card already exists in the list of sharedPref
                            SharedPreferences preferences = await SharedPreferences.getInstance();
                            String? content = preferences.getString("list");
                            var list = json.decode(content!);
                            List <Favoris> actualList = [];
                            for (var temp in list) {
                              actualList.add(Favoris.fromJson(temp));
                            }
                            Favoris selected = Favoris(name:widget.name,idFlag: widget.idFlag,pop: widget.pop,year: widget.year);
                            actualList= selected.remove(actualList);
                            preferences.setString("list", jsonEncode(actualList));
                            Carte.count--;
                            test = "true";
                            setState(() {

                             if(ModalRoute.of(context)?.settings.name=='/F')
                            {  Navigator.pushReplacementNamed(context, '/F');}
                            });
                          },
                            icon: const Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.yellow,
                            ),
                          ) : const SizedBox(width: 0, height: 0),
                          SizedBox(width: 90, height: height * 2 / 100),
                          Text(widget.year, style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ],),
                ),
              ],),

          ),
        ));
  }
}