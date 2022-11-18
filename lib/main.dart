// main function which contains the routes
import 'package:flutter/material.dart';
import 'package:lovester/screens/home.dart';
import 'package:lovester/screens/country_filter.dart';
import 'package:lovester/screens/home_filtred.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lovester/screens/favourites.dart';
void main ()  {
  SharedPreferences.setMockInitialValues({});
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',


      routes:{'/':(context) => const Home(),
        '/Country':(context) => const Country(),
       '/HomeF':(context)=> const HomeF(),
        '/F':(context)=> const Favourite(),

      }
  ));

}

