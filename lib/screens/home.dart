import 'package:flutter/material.dart';
import 'package:lovester/widgets/appbar.dart';
import 'package:lovester/screens/card.dart';
import 'countryFilter.dart';
import 'package:lovester/widgets/bottom.dart';
import 'package:lovester/functions/getApiPop.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flag/flag.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List<dynamic>? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPop();
  }
  void getPop() async{
    data=await  ApiPop.getData(0);
    // b=await data.getData() ;
    setState(() {
    });
  }
  var size,height,width;
  @override
  Widget build(BuildContext context) {

    const activeColor = Colors.grey;
    const inactiveColor = Colors.yellow;
    bool isSelected;
    isSelected=true;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body:Column(

      children:[
        SizedBox(
          height:height/26,
        ),
   appBar(context),
Divider(
  color:Colors.black12,
),
data?.length!=null ? Expanded( child:
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
                    height:height*3/10,
                    width:185,
                    child: Column(
                      children:[ Row(
                        children : [
                          SizedBox(width:10,height:height/50),ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),//or 15.0
                            child: Container(
                              height: height*2/25,
                              width: 55,
                              child: Flag.fromString(
                                "TN",
                                height: height/10,
                                width:80,
                              ),
                            ),
                          ),
                          SizedBox(width:5),
                          Text("Tunisia",
                              style:TextStyle(fontSize:25,fontWeight: FontWeight.bold)),
                        ],  ),
                        SizedBox(height:height*2/100),
                        Text("Populations",style:TextStyle(fontSize:20,fontWeight: FontWeight.bold)),

                        Text(data![index]["value"],style:TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
                        SizedBox(height:height*2/100),
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
                            SizedBox(width:1,height:height*2/500),
                            SizedBox(width:90,height:height*2/200),
                            Text(data![index]["year"],style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
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

