import 'dart:io';

import 'package:flutter/material.dart';
import 'package:helpmypetfin/src/bloc/scan_bloc.dart';
import 'package:helpmypetfin/src/models/scan_model.dart';
import 'package:helpmypetfin/src/pages/mapa_page.dart';
import 'package:helpmypetfin/src/utils/scan_utils.dart' as utils;
import 'package:qrcode_reader/qrcode_reader.dart';
import 'direcciones_page.dart';

class QrReaderHomePage extends StatefulWidget {

  @override
  _QrReaderHomePageState createState() => _QrReaderHomePageState();
}

 int currentIndex = 0;
class _QrReaderHomePageState extends State<QrReaderHomePage> {
  final scansBloc = new ScansBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Qr Scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: ()=> Navigator.pushReplacementNamed(context, 'home'),
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: ()=>_scanQR(context),
      ),
      );
  }

_scanQR(BuildContext context) async {

//https://github.com/salbisser105/HelpMyPet
// geo:6.209331523868077,-75.5649699254883

  //Dato que se deberia recibir al scanear algo.
  String futureString;



  try {
    futureString = await new QRCodeReader().scan();
  } catch(e) {
    futureString = e.toString();
  }

  if(futureString !=null) {
  final scan = ScanModel(valor: futureString);
  scansBloc.agregarScan(scan);
 

if( Platform.isIOS ){
  Future.delayed(Duration (milliseconds: 750), () {
   utils.abrirScan( context,scan ) ;
  });
}else{

  utils.abrirScan( context, scan);
  }

}
}




  Widget _callPage(int paginaActual) {
    switch (paginaActual ) {
      case 0: return MapaPage();
      case 1: return DireccionesPage();

      default:
       return MapaPage();
    }
  }

  Widget _crearBottomNavigationBar(){

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap:  (index) {
        setState(() {
          currentIndex =index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Mapas')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_5),
          title: Text('Direcciones')
        ),
        
      ],
    );

  }
}