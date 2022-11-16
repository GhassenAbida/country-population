import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lovester/functions/getApi.dart';
import 'package:flag/flag.dart';
import 'package:lovester/functions/getApiFilter.dart';



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
  void getCountry() async{
    data=await  Api.getData();
    // b=await data.getData() ;
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
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
                      int i=index;
                      Navigator.pushReplacementNamed(context, '/HomeF',arguments:{
                        int :i  ,

                      });
                    },
                    hoverColor: Colors.white,
                    title:Text(data![index]["name"]!,
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
