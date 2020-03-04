import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:toast/toast.dart';
import 'package:geolocator/geolocator.dart';

class Maps extends StatefulWidget{
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps>{
  MapType _defaultMapType = MapType.normal;
  Completer<GoogleMapController> _controller = Completer();
  static LatLng _initialPosition;
  static LatLng _lastMapPosition = _initialPosition;
  Position _currentPosition;

  @override
  void initState(){
    super.initState();
    _getUserLocation();
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller.complete(controller);
    });
  }

  void _getUserLocation() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
      _initialPosition = LatLng(position.latitude, position.longitude);
    });
  }

  void _changeMapType() {
    setState(() {
      _defaultMapType = _defaultMapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(
          //title: Text('LunchTime'),
          //centerTitle: true,
        //),
        body: _initialPosition == null ? Container(
          child: Center(
            child: Text(
              'Cargando Mapa..', 
              style: TextStyle(
                fontFamily: 'Avenir-Medium', 
                color: Colors.blueAccent[400]),
                ),),
            ) : 
            Container(
              child: Stack(children: <Widget>[
                GoogleMap(
                  mapType: _defaultMapType,
                  myLocationEnabled: true,
                  zoomGesturesEnabled: true,
                  rotateGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                  myLocationButtonEnabled: true,
                  onMapCreated: _onMapCreated,
                  compassEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: _initialPosition,
                    zoom: 20,
                  ),
                ),
            Container(
              margin: EdgeInsets.only(top: 80, right: 10),
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  FloatingActionButton(
                      child: Icon(Icons.layers),
                      elevation: 5,
                      backgroundColor: Colors.cyan[200],
                      onPressed: () {
                        _changeMapType();
                        Toast.show('LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}', context, duration: Toast.LENGTH_LONG);
                        print('Cambiando el tipo de Mapa');
                      }),
                ],
              ),
            ),
          ],
        ),
    ),
    );
  }
}
