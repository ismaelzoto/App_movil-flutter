// snippet: mateapp
import 'package:flutter/material.dart';
import 'package:itca/Barra.dart';
 
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi app',
      home: Barra(),
      debugShowCheckedModeBanner: false,
    );
  }
}