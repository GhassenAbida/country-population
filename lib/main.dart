import 'package:flutter/material.dart';
import 'package:lovester/screens/home.dart';
import 'package:lovester/screens/card.dart';
import 'package:lovester/functions/getApiPop.dart';
import 'package:lovester/screens/countryFilter.dart';
import 'package:lovester/screens/HomeFiltred.dart';
void main ()  {

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',


      routes:{'/':(context) => const Home(),
        '/Country':(context) => const Country(),
       '/HomeF':(context)=> const HomeF(),

      }
  ));

}

