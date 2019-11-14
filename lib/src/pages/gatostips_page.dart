import 'package:flutter/material.dart';



class GatosTipsPage extends StatelessWidget {
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
            _crearTexto6(),
            Divider(), 
            _crearTexto7(),
            Divider(), 
            _crearTexto8(),
            Divider(), 
            _crearTexto9(),
            Divider(), 
            _crearTexto10(),
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
          image: NetworkImage('https://scontent-mia3-2.xx.fbcdn.net/v/t1.0-9/75231687_1092607547613724_7815440203417387008_n.jpg?_nc_cat=101&_nc_oc=AQnIyCp9d9DcZJ-XWMbWKyw7TI6UROpvv9-dLcYlNN_1s4BLb5B4QB7nqrIG1vZ8YRM&_nc_ht=scontent-mia3-2.xx&oh=93f6ee03868e79435e02ea603ddf0f3e&oe=5E44B6A3'),
          height: 300.0,
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
        heroTag: "add",
        child: Icon(Icons.home),
        onPressed:(){
          Navigator.pop(context);
          },
      )
    ],
  
  );

}
Widget _crearTexto6() {

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 40.0 ),
        child: Text(
          ' EL JUEGO: los gatos desde pequeños son animales curiosos, intrépidos y grandes cazadores. Con su domesticación es una práctica que no muchos realizan a diario, sobre todo los gatos indoor. No te olvides de estimular a tu mascota. Podemos utilizar un láser o fabricar juguetes caseros. ¡Nunca tus manos! Utiliza tu imaginación, pero siempre debemos conducir el juego a un premio. Algo que simule lo que él cazaría en el exterior, es suficiente con un poco de comida.',
          textAlign: TextAlign.justify,
        ),
      ),
    );

  }
  Widget _crearTexto7() {

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 40.0 ),
        child: Text(
          'ENRIQUECIMIENTO AMBIENTAL: mientras tú has estado todo el día fuera de casa trabajando, tu gato ha pasado la mayor parte del tiempo descansando. Esto hace que muchos de ellos se activen durante la noche y te molesten al dormir. Para evitar esto debes facilitarle juguetes que estimulen su inteligencia. Puedes proporcionarle estanterías a diversas alturas y esconder algunos premios antes de irte de casa ¡que se divierta!',
          textAlign: TextAlign.justify,
        ),
      ),
    );

  }
  Widget _crearTexto8() {

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 40.0 ),
        child: Text(
          'LA ALIMENTACIÓN: es necesario que desde gatitos acostumbremos a estos peludos a cambiar de sabores y texturas para que sea sencillo poder variar su dieta cuando sea necesario. Además es importante que ésta contenga un alto porcentaje de proteínas, ya que ellos en libertad comerían pequeños mamíferos y aves.',
          textAlign: TextAlign.justify,
        ),
      ),
    );

  }
  Widget _crearTexto9() {

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 40.0 ),
        child: Text(
          'EL AGUA: los gatos no son grandes bebedores. Esto puede conllevar a problemas en las vías urinarias. Es por ello que debemos fomentar su ingesta de agua. Podemos conseguirlo colocando fuentes de agua para captar su atención. Varios puntos de agua limpia y fresca en la vivienda.',
          textAlign: TextAlign.justify,
        ),
      ),
    );

  }
  Widget _crearTexto10() {

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 40.0 ),
        child: Text(
          'EL ARENERO: los gatos son muy limpios. Por esto el arenero debe ser grande, descubierto y limpiarse a diario. La arena debe ser confortable y el número de areneros 1 o 2 por cada gato. Orinar fuera de la bandeja puede indicar que algo en el arenero o en nuestro felino no va bien. Muchas veces es estrés, recuerda: ¡los gatos no son vengativos!',
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
          'En esta sección encontraras tips para tus gatos.',
          textAlign: TextAlign.justify,
        ),
      ),
    );

  }
  

}