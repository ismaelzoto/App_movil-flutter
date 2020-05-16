import 'package:flutter/material.dart';
import 'package:itca/pages/maps_page.dart';

class TabEvent extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.videocam),
          title: Text('Video'),
        ),
        ListTile(
          leading: Icon(Icons.photo_album),
          title: Text('Album'),
          onTap: ()=> {},
        ),
        ListTile(
          leading: Icon(Icons.layers),
          title: Text('Mapas'),
          onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Mapspage())),
        ),
      ],
    );
  }
}

