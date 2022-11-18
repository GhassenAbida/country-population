
// this is the home screen
// this screen will take by default albania as country in the cards
import 'package:flutter/material.dart';
import 'package:lovester/widgets/appbar.dart';
import 'package:lovester/widgets/card.dart';
import 'package:lovester/widgets/bottom.dart';
import 'package:lovester/functions/api_population_first_country.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  // ApiPopulation will get the data (population/year) of the first index(0)
  void getPop() async{
    data=await  ApiPop.getData(0);
    // b=await data.getData() ;
    setState(() {
    });
  }

  var activeColor = Colors.grey;
  var inactiveColor = Colors.yellow;
  bool isSelected=false;
  @override
  Widget build(BuildContext context) {
  var  size = MediaQuery.of(context).size;
   var height = size.height;
  // var width = size.width;
    return Scaffold(
      body:Column(
      children:[
        SizedBox(
          height:height/26,
        ),
   appBar(),
const Divider(
  color:Colors.black12,
),
data?.length!=null ? Expanded( child:
        SingleChildScrollView(
   child: GridView.count(
       scrollDirection: Axis.vertical,
       shrinkWrap: true,
crossAxisCount:2,
    children:List.generate(data!.length,(index){
      return(
          SingleChildScrollView (
            scrollDirection: Axis.vertical,
child: Carte(name:"Albania",idFlag:"AL",pop:data![index]["value"],year:data![index]["year"],bool:"true"),
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
       const bottom(),
],      ),
    );
  }
}

