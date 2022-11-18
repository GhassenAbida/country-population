// this is used to get the countries and their flags  for the filter
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lovester/functions/get_api_for_flag.dart';
import 'package:flag/flag.dart';
import 'package:lovester/functions/api_population_first_country.dart';
class Country extends StatefulWidget {
  const Country({Key? key}) : super(key: key);
  @override
  State<Country> createState() => _CountryState();
}
class _CountryState extends State<Country> {
  List<dynamic>? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountry();
  }
  // this method gets the data from the json with getData() ( without using the model )
  void getCountry() async{
    data=await  Api.getData();
    // b=await data.getData() ;
    setState(() {
    });
  }
  void getPop() async{
    data=await  ApiPop.getData(0);
    // b=await data.getData() ;
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context)  {
    var size = MediaQuery.of(context).size;
    var height = size.height;
   var  width = size.width;
    return Scaffold(
      body: data!=null?  ListView.builder(
          itemCount:data!.length,
          itemBuilder:(context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),

              child: Card(
                  color:Colors.white,
                  child:ListTile(
                    onTap:(){
                      Navigator.pushReplacementNamed(context, '/HomeF',arguments:{
                        String:data![index]["name"] ,dynamic:data![index]["iso2"],
                      });
                    },
                    hoverColor: Colors.white,
                    title:Text(data![index]["name"]!,
                    style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    leading:  ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),//or 15.0
                      child: Container(
                        height: height/12,
                        width: width/12,
                        color: Colors.white,
                        child:  Flag.fromString(
                          data![index]["iso2"],
                          height: height/8,
                        ),
                      ) ,
                    ),
                  )
              ),);
          } ):  SpinKitFadingCircle(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven ? Colors.white : Colors.white,
            ),
          );
        },
      ),
    );
  }
}
