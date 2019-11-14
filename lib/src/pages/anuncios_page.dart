import 'package:flutter/material.dart';
import 'package:helpmypetfin/src/pages/noticias_page.dart';
import 'package:helpmypetfin/src/pages/veterinarias_page.dart';



class AnunciosPage extends StatefulWidget {
  @override
  _AnunciosPageState createState() => _AnunciosPageState();
}
int currentIndex = 0;

class _AnunciosPageState extends State<AnunciosPage> {
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
      case 0: return VeterinariasPage();
      case 1: return NoticiasPage();

      default:
       return VeterinariasPage();
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
          icon: Icon(Icons.local_convenience_store),
          title: Text('Centros de atención')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.description),
          title: Text('Noticias')
        ),
        
      ],
    );

  }


}