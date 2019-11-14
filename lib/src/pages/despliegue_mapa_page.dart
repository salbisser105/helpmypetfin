import 'package:latlong/latlong.dart';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:helpmypetfin/src/providers/db_provider.dart';


class MapaDPage extends StatefulWidget {

  @override
  _MapaDPageState createState() => _MapaDPageState();
}

class _MapaDPageState extends State<MapaDPage> {
  final map = new MapController();

  String tipoMapa ='streets';

  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Coordernadas QR'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {
              map.move(scan.getLatLng(), 15);
            },
          )
        ],
      ),
      body: _crearFlutterMap(scan),
      floatingActionButton: _crearBotonFlotante(context),
    );
  }


  //Con este metodo se crea el mapa.
  Widget _crearFlutterMap (ScanModel scan) {

    return FlutterMap(
      mapController: map,
      options: MapOptions(
        center: scan.getLatLng(),
        zoom: 15
      ),
      layers: [
        _crearMapa(),
        _crearMarcadores(scan),
      ],
    );
  }

 _crearMapa() {

   return TileLayerOptions(
     urlTemplate: 'https://api.mapbox.com/v4/'
     '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
    additionalOptions: {
      'accessToken': 'pk.eyJ1Ijoic2FudGlhZ29hMTIzNCIsImEiOiJjazJhaHB4d3QyaXJ5M2JwaGtmaXNuaHlnIn0.HOwZ1BcPYOLmFXsmI8Y7dw',
      'id': 'mapbox.$tipoMapa'
      //tipos de mapa streets,dark,light,outdoors,satellite
    }
   );

 }

 _crearMarcadores (ScanModel scan ) {
   return MarkerLayerOptions(
     markers: <Marker>[
       Marker(
         width: 100.0,
         height: 100.0,
         point: scan.getLatLng(),
         builder: (context) => Container(
           child: Icon(
             Icons.pets,
              size: 30.0 ,
              color: Colors.blue,
              ),
         )

       )
     ]
   );
 }

 Widget _crearBotonFlotante(BuildContext context){

   return FloatingActionButton(
     child: Icon(Icons.repeat),
     backgroundColor: Colors.blue,
     onPressed: () {
       if(tipoMapa == 'streets'){
         tipoMapa = 'outdoors';
       }else if (tipoMapa == 'outdoors'){
         tipoMapa = 'satellite';
       }else {
         tipoMapa = 'streets';
       }
       setState(() {});
     },
   );
 }
}