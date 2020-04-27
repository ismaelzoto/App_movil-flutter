// snippet: mateapp
import 'package:flutter/material.dart';
import 'package:itca/pages/maps_page.dart';
import 'package:itca/pages/home_page.dart';
 
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LunchTime',
      initialRoute: 'home',
      routes: {
        'home' : (BuildContext context) => HomePage(),
        'mapa' : (BuildContext context) => Mapspage()
      },
      theme: ThemeData(
        primaryColor: Colors.deepPurple
      ),
    );
  }
}