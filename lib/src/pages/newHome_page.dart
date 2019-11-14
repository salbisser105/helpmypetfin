import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:helpmypetfin/src/pages/anuncios_page.dart';
import 'package:helpmypetfin/src/pages/codigo_qr.dart';
import 'package:helpmypetfin/src/pages/encontrados_page.dart';
import 'package:helpmypetfin/src/pages/perdidos_page.dart';
import 'package:helpmypetfin/src/pages/qrreaderhome_page.dart';
import 'package:helpmypetfin/src/pages/tips.dart';

class NHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack
      (children: <Widget>[
        _fondoApp(),

      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _titulos(),
            _botonesRedondeados(context),
          ],
        ),
      )

      ],)
    );
  }

  

  Widget _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin:FractionalOffset(0.0,0.3) ,
          end: FractionalOffset(0.0,1.0),
          colors: [
            Color.fromRGBO(0, 136, 255, 0.6),
            Color.fromRGBO(0, 0, 0, 1.0)
          ]

        )
      ),
    );


    final cajaAzul = Transform.rotate(
      angle: -pi /5.0,
      child: Container(
      height: 340.0,
      width: 340.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80.0),
        color: Colors.white38

      ),
    )
    );
    
    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(
          top: -100.0,
          child: cajaAzul,
        )
        
      ],
    );

  }

Widget _titulos() {
  return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Help My Pet', style:  TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),),
          SizedBox(height: 10.0)
        ],
      ),
    ),
  );
}
  Widget _botonesRedondeados(BuildContext context) {

    return Table(
      children: [
        TableRow(
          children: [
           _crearBotonRedondeado(Colors.blue, Icons.fiber_new, 'Crear Codigo QR', context, 'codigoqr'),
           _crearBotonRedondeado1(Colors.blue, Icons.chrome_reader_mode, 'Leer Codigo QR',context, 'qrreader' ),
          
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado2(Colors.blue, Icons.mood_bad, 'Mascotas Perdidas',context, 'perdidos'),
           _crearBotonRedondeado3(Colors.blue, Icons.find_in_page, 'Mascotas  Encontradas ', context, 'encontrados'),
          ],
        ),
        TableRow(
          children: [
            _crearBotonRedondeado4(Colors.blue, Icons.chat, 'Tips Mascotas', context, 'tips'),
          _crearBotonRedondeado5(Colors.blue, Icons.explicit, 'Extras', context, 'anuncios'),
           
          ],
        ),
      ],
    );

  }

  Widget _crearBotonRedondeado( Color color, IconData icono, String texto, BuildContext context, route ){
    
    return ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
          height: 115.0,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62,66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: ListView(
            children: <Widget>[
              ListTile(
              title: Text(texto, style: TextStyle(color:Colors.white )),
              leading:CircleAvatar(
                child: Icon(icono,size: 25.0,),
              ),
            onTap: (){
              final route = MaterialPageRoute(
                builder: (context){
                  return CodigoQRPage();
                }
              );
              Navigator.push(context, route);
            },
          ), 
            ],     
        ),  
      ),
    ),
    );
  }

  Widget _crearBotonRedondeado1( Color color, IconData icono, String texto, BuildContext context, route ){
    
    return ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
          height: 115.0,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62,66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: ListView(
            children: <Widget>[
              ListTile(
              title: Text(texto, style: TextStyle(color:Colors.white )),
              leading:CircleAvatar(
                child: Icon(icono,size: 25.0,),
              ),
            onTap: (){
              final route = MaterialPageRoute(
                builder: (context){
                  return QrReaderHomePage();
                }
              );
              Navigator.push(context, route);
            },
          ), 
            ],     
        ),  
      ),
    ),
    );
  }


  Widget _crearBotonRedondeado2( Color color, IconData icono, String texto, BuildContext context, route ){
    
    return ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
          height: 115.0,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62,66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: ListView(
            children: <Widget>[
              ListTile(
              title: Text(texto, style: TextStyle(color:Colors.white )),
              leading:CircleAvatar(
                child: Icon(icono,size: 25.0,),
              ),
            onTap: (){
              final route = MaterialPageRoute(
                builder: (context){
                  return PerdidosPage();
                }
              );
              Navigator.push(context, route);
            },
          ), 
            ],     
        ),  
      ),
    ),
    );
  }

  Widget _crearBotonRedondeado3( Color color, IconData icono, String texto, BuildContext context, route ){
    
    return ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
          height: 115.0,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62,66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: ListView(
            children: <Widget>[
              ListTile(
              title: Text(texto, style: TextStyle(color:Colors.white )),
              leading:CircleAvatar(
                child: Icon(icono,size: 25.0,),
              ),
            onTap: (){
              final route = MaterialPageRoute(
                builder: (context){
                  return EncontradosPage();
                }
              );
              Navigator.push(context, route);
            },
          ), 
            ],     
        ),  
      ),
    ),
    );
  }

Widget _crearBotonRedondeado4( Color color, IconData icono, String texto, BuildContext context, route ){
    
    return ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
          height: 115.0,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62,66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: ListView(
            children: <Widget>[
              ListTile(
              title: Text(texto, style: TextStyle(color:Colors.white )),
              leading:CircleAvatar(
                child: Icon(icono,size: 25.0,),
              ),
            onTap: (){
              final route = MaterialPageRoute(
                builder: (context){
                  return TipsPage();
                }
              );
              Navigator.push(context, route);
            },
          ), 
            ],     
        ),  
      ),
    ),
    );
  }
  Widget _crearBotonRedondeado5( Color color, IconData icono, String texto, BuildContext context, route ){
    
    return ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
          height: 115.0,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62,66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: ListView(
            children: <Widget>[
              ListTile(
              title: Text(texto, style: TextStyle(color:Colors.white )),
              leading:CircleAvatar(
                child: Icon(icono,size: 25.0,),
              ),
            onTap: (){
              final route = MaterialPageRoute(
                builder: (context){
                  return AnunciosPage();
                }
              );
              Navigator.push(context, route);
            },
          ), 
            ],     
        ),  
      ),
    ),
    );
  }

}

