// for testing the filter
import 'package:flutter/material.dart';
import 'package:lovester/widgets/appbar.dart';
import 'package:lovester/screens/card.dart';
import 'countryFilter.dart';
import 'package:lovester/widgets/bottom.dart';
import 'package:lovester/functions/getApiPop.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flag/flag.dart';
import 'package:lovester/functions/getApiFilter.dart';

class HomeF extends StatefulWidget {
  const HomeF({Key? key}) : super(key: key);
  @override
  State<HomeF> createState() => _HomeState();
}
class _HomeState extends State<HomeF> {
  List<dynamic>? data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPop();
  }
  void getPop() async{
    data=await  ApiPopF.getData();
    // b=await data.getData() ;
    setState(() {
    });
  }
  var size,height,width;
  @override
  Widget build(BuildContext context) {
    dynamic map = ModalRoute.of(context)?.settings.arguments;
    const activeColor = Colors.grey;
    const inactiveColor = Colors.yellow;
    bool isSelected;
    isSelected=true;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
          SizedBox(
            height:height/26,
          ),
          appBar(context),
          Divider(
            color:Colors.black12,
          ),
          data?[map[int]]["populationCounts"]?.length !=null  ? Expanded( child:
          SingleChildScrollView(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount:data!.length,
                itemBuilder:(context,index){
                  return(
                      Card(
                        color: Colors.white60,
                        shape: BeveledRectangleBorder(
                          side:BorderSide(
                            color: isSelected? activeColor:inactiveColor,
                            width:3,

                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                          },
                          onLongPress: ()async {
                            isSelected=false;
                            setState(() {
                            });
                          },
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

                                    Text(data?[map[int]]["populationCounts"]![index]["value"],style:TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
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
                                        Text(data?[map[int]]["populationCounts"]![index]["year"],style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ],),
                              ),
                            ],  ),

                        ),
                      )
                  );
                }
            ),
          ),
          ):
          Expanded( child: SpinKitFadingCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color:  Colors.greenAccent ,
                ),
              );
            },
          ),),
          Divider(
              color: Colors.black
          ),
          bottom(context),
        ],      ),
    );
  }
}

