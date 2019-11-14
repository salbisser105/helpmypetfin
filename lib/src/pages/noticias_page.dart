import 'package:flutter/material.dart';



class NoticiasPage extends StatelessWidget {
  final estiloTitulo    = TextStyle( fontSize: 20.0, fontWeight: FontWeight.bold );
  final estiloSubTitulo = TextStyle( fontSize: 18.0, color: Colors.grey );

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearImagen(context), 
            Divider(),   
            _crearTexto11(),
            Divider(),      
            _crearTexto1(),
            Divider(), 
            _crearTexto2(),
            Divider(), 
            _crearTexto3(),
            Divider(), 
            _crearTexto4(),
            Divider(), 
            _crearTexto5(),
            Divider(), 
            _crearBoton(context),
          ],
        ),
        
      ),
      

      );
        
      
      
      // floatingActionButton:_crearBoton(context),
    
 
}
Widget _crearImagen(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GestureDetector(
        onTap: ()=> Navigator.pushNamed(context, 'scroll'),
        child: Image(
          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT--R7TbMTcA2ATiPe4LWxrpPlD2sBLDFfNwboqA_A4nj_ynO0r'),
          height: 250.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _crearBoton(BuildContext context ) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      new FloatingActionButton(
        heroTag: "adde",
        child: Icon(Icons.home),
        onPressed:(){
          Navigator.pop(context);
          },
      )
    ],
  
  );

}
Widget _crearTexto1() {

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 40.0 ),
        child: Text(
          ' En Medellín estrenan una aplicación para adoptar animales del refugio La Perla. ' +
          'Ver mas información aca: https://www.elespectador.com/noticias/nacional/antioquia/en-medellin-estrenan-una-aplicacion-para-adoptar-animales-del-refugio-la-perla-articulo-873767',
          textAlign: TextAlign.justify,
        ),
      ),
    );

  }
   Widget _crearTexto2() {

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 40.0 ),
        child: Text(
          '¿Hay que cepillar los dientes de las mascotas ?                          '+
          'Visualizar la noticia en el siguiente link:    www.elcolombiano.com/cultura/mascotas/hay-que-cepillar-los-dientes-de-las-mascotas-BP11785271',
          textAlign: TextAlign.justify,
        ),
      ),
    );

  }

  Widget _crearTexto3() {

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 40.0 ),
        child: Text(
          ' ¿Qué debe darle de comer y que nó a su gato o a su perro?  '
          ' https://www.elcolombiano.com/tendencias/a-la-dieta-del-perro-y-el-gato-pongale-atencion-AC11647340 ',

          textAlign: TextAlign.justify,
        ),
      ),
    );



}

Widget _crearTexto4() {

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 40.0 ),
        child: Text(
          '¿Cómo cuidar el pelaje de los perros?'
          '                   https://www.elcolombiano.com/cultura/mascotas/como-cuidar-el-pelo-de-los-perros-NG11429172'
          ,
          textAlign: TextAlign.justify,
        ),
      ),
    );

  }
  Widget _crearTexto5() {

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 40.0 ),
        child: Text(
          'Cuide a sus mascotas de enfermedades silenciosas        '
          'https://www.elcolombiano.com/tendencias/enfermedades-renales-y-cardiopatias-en-perros-y-gatos-y-como-prevenir-que-se-compliquen-EC11131050'
          ,
          textAlign: TextAlign.justify,
        ),
      ),
    );

  }

  Widget _crearTexto11() {

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 40.0 ),
        child: Text(
        'En esta sección encontrarás noticias acerca de mascotas.',
        ),
      ),
    );

  }

}