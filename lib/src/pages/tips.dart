import 'package:flutter/material.dart';
import 'package:helpmypetfin/src/pages/gatostips_page.dart';
import 'package:helpmypetfin/src/pages/perrostips_page.dart';



class TipsPage extends StatefulWidget {
  @override
  _TipsPageState createState() => _TipsPageState();
}
int currentIndex = 0;

class _TipsPageState extends State<TipsPage> {
  final estiloTitulo    = TextStyle( fontSize: 20.0, fontWeight: FontWeight.bold );

  final estiloSubTitulo = TextStyle( fontSize: 18.0, color: Colors.grey );

  @override

  Widget build(BuildContext context) {   
        return Scaffold(
  
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottomNavigationBar(),
      );

}
Widget _callPage( int paginaActual) {

    switch (paginaActual ) {
      case 0: return PerrosTipsPage();
      case 1: return GatosTipsPage();

      default:
       return PerrosTipsPage();
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
          icon: Icon(Icons.pets),
          title: Text('Tips perros')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pets),
          title: Text('Tips gatos')
        ),
        
      ],
    );

  }


}