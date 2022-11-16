import 'package:flutter/material.dart';
import 'package:flag/flag.dart';
class Carte extends StatefulWidget {
   dynamic pop="";
    dynamic year="";
   Carte(dynamic pop,dynamic year){
     this.pop=pop;
     this.year=year;
   }


  @override
  State<Carte> createState() => _CarteState();
}

class _CarteState extends State<Carte> {
  final activeColor = Colors.grey;
  final inactiveColor = Colors.yellow;
  bool isSelected=true;
  @override
    Widget build(BuildContext context) {

    return

               Card(
                color: Colors.white60,
                shape: BeveledRectangleBorder(
                  side:BorderSide(
                    color: isSelected? activeColor:inactiveColor,
                    width:3,

                  ),
                ),
                    child: GestureDetector(
                      child:

                    Column(
                      children: [
                        SizedBox(
                          height:192,
                          width:185,
                          child: Column(
                            children:[ Row(
                              children : [
                                SizedBox(width:10,height:10),ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),//or 15.0
                      child: Container(
                            height: 55,
                            width: 55,

                             child: Flag.fromString(
                                "TN",
                                height: 50,
                               width:80,
                              ),
                      ),
                    ),
                               SizedBox(width:5),
                               Text("Tunisia",
                              style:TextStyle(fontSize:25,fontWeight: FontWeight.bold)),
                          ],  ),
                              SizedBox(height:20),
                              Text("Populations",style:TextStyle(fontSize:20,fontWeight: FontWeight.bold)),

                              Text("carte?.pop",style:TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
                              SizedBox(height:20),
                              Row(
                                children: [
                                  isSelected==false? IconButton( onPressed:(){
                                    isSelected=true;
                                    setState(() {

                                    });
                                  },
                                   icon:Icon(
                                     Icons.star,
                                     size:30,
                                     color:Colors.yellow,
                                   ),
                                  ) :
                                    SizedBox(width:1,height:2),
                                 SizedBox(width:90,height:20),
                                  Text("2017",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                                ],
                              ),
           ],),
                        ),

                ],  ),
                    onTap: () {
                    },
                    onLongPressStart: (_)async {
                      isSelected=false;
                      setState(() {

                      });
                      },


                    ),

    );

  }
}