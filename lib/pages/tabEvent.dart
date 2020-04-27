import 'package:flutter/material.dart';

class TabEvent extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.map),
          title: Text('Mapa'),
        ),
        ListTile(
          leading: Icon(Icons.photo_album),
          title: Text('Album'),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Telefono'),
        ),
      ],
    );
  }
}