// this is the favoris page it shows the cards that are listed as favourites!!

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lovester/widgets/appbar.dart';
import 'package:lovester/widgets/card.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);
  @override
  State<Favourite> createState() => _FavouriteState();
}
class _FavouriteState extends State<Favourite> {
var list=[];
  String? name;
  String? year;
  String? id;
  String? value;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCarte();
    work();
  }
  void work() async{
    await getCarte();
  }
  @override
  Widget build(BuildContext context) {
    var  size = MediaQuery.of(context).size;
    var height = size.height;
    return Scaffold(
            body:Column(
            children:[
              SizedBox(
                height:height/26,
              ),
             const appBar(),
              const Divider(
                color:Colors.black12,
              ),
           list!=null?   GridView.count(
             scrollDirection: Axis.vertical,
             shrinkWrap: true,
             crossAxisCount:2,
             children:List.generate(list.length,(index){
               return(
                   SingleChildScrollView (
                     scrollDirection: Axis.vertical,
                     child: Carte(name :list[index]["name"] ,idFlag:list[index]["idFlag"] ,pop: list[index]["pop"],year: list[index]["year"],bool:"false"  ),
                   ));
             }
             ),
           )
               : Expanded( child: SpinKitFadingCircle(
             itemBuilder: (BuildContext context, int index) {
               return const DecoratedBox(
                 decoration: BoxDecoration(
                   color:  Colors.greenAccent ,
                 ),
               );
             },
           ),),
       ], ),
    );
  }
  Future<void> getCarte() async{
final SharedPreferences preferences =await SharedPreferences.getInstance();
String? content=preferences.getString("list");
 list = json.decode(content!);

setState(() {

});

  }
}
