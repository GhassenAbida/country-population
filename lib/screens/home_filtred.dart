import 'package:flutter/material.dart';
import 'package:lovester/widgets/appbar.dart';
import 'package:lovester/widgets/card.dart';
import 'package:lovester/widgets/bottom.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lovester/functions/get_api_for_filter.dart';
import 'package:lovester/model/populationModel.dart';

class HomeF extends StatefulWidget {
  const HomeF({Key? key}) : super(key: key);
  @override
  State<HomeF> createState() => _HomeState();
}
class _HomeState extends State<HomeF> {
 AutoGenerate? auto;

  var isLoaded=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // getPop0();
    getData();
  }
  getData() async{
    auto=await ApiPopF.getData();
    if (auto!=null){
      setState((){
        isLoaded=true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    dynamic Map=ModalRoute.of(context)?.settings.arguments;
    var list ;
    if(auto!=null){list= auto!.filter(Map[String]);};
    var size = MediaQuery.of(context).size;
    var height = size.height;
    //width = size.width;
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
          isLoaded ? Expanded( child:
          SingleChildScrollView(
            child: GridView.count(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              crossAxisCount:2,
              children:List.generate(list.length,(index){
                return(
                    SingleChildScrollView (
                      scrollDirection: Axis.vertical,
                      child: Carte(name:Map[String] ,idFlag:Map[dynamic],pop:list[index].value,year:list[index].year,bool:"true"),
                    ));
              }
              ),
            ),
          )):
          Expanded( child: SpinKitFadingCircle(
            itemBuilder: (BuildContext context, int index) {
              return const DecoratedBox(
                decoration: BoxDecoration(
                  color:  Colors.greenAccent ,
                ),
              );
            },
          ),),
          const Divider(
              color: Colors.black
          ),
         const  bottom(),
        ],      ),
    );
  }
}

