//snippet: mateapp
//import 'dart:io';
//import 'package:flutter/foundation.dart';
import 'package:itca/bloc/provider.dart';

import 'package:flutter/material.dart';
import 'package:itca/pages/login_page.dart';
import 'package:itca/pages/maps_page.dart';
import 'package:itca/pages/home_page.dart';
import 'package:itca/pages/producto_page.dart';
import 'package:itca/pages/tab_page.dart';
 
void main() => runApp(MyApp());
// FlutterError.onError = (FlutterErrorDetails details) {
//     FlutterError.dumpErrorToConsole(details);
//     if (kReleaseMode)
//       exit(1);
//   };
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Provider(
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LunchTime',
      initialRoute: 'login',
      routes: {
        'login'    : (BuildContext context) => LoginPage(),
        'home'     : (BuildContext context) => HomePage(),
        'mapa'     : (BuildContext context) => Mapspage(),
        'producto' : (BuildContext context) => ProductoPage(),  
        },
      theme: ThemeData(
        primaryColor: Colors.deepPurple
       ),
      ),
    );
  }
}

