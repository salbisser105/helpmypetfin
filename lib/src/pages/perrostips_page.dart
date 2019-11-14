import 'package:flutter/material.dart';



class PerrosTipsPage extends StatelessWidget {
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
          image: NetworkImage('https://scontent-mia3-2.xx.fbcdn.net/v/t1.0-9/74339584_1092607557613723_212667788152537088_n.jpg?_nc_cat=105&_nc_oc=AQn6c0yp4hpgVFji1SlgK83vbwlyRf1Z4VsZZwtXVNUQi-dSnvKGw9AxjF_aIxq1Ac8&_nc_ht=scontent-mia3-2.xx&oh=c45def7a0f86fb8ab8c68f2a24039b68&oe=5E5D78F2'),
          height: 350.0,
          fit: BoxFit.fitWidth,
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
          ' Acaricia a tu perro. Un trato amoroso es muy aconsejable para la salud de tu mascota. Tómate algún momento del día para compartir con tu perro y consigue un tiempo de calidad. Aprovecha para acariciarlo, abrazarlo o darle un masaje relajante en patas y muslos. ',
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
          'Acompaña a tu perro y no lo dejes solo durante largos períodos de tiempo: Tener un patio cercado con una caseta de perro es una ventaja, en especial para los perros grandes y muy activos. Sin embargo, intenta no dejar solo a tu perro fuera durante largos períodos de tiempo. Los perros necesitan compañerismo y sentirse acompañados por nosotros. Deben de pasar el mayor tiempo posible junto a su familia, no estar siempre solos.',
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
          ' Sé leal y paciente con tu fiel compañero: Asegúrate de que las expectativas que tienes depositadas en tu perro son razonables y recuerda siempre que la gran mayoría de los problemas de comportamiento en perros se pueden resolver. No todos los problemas son de conducta, muchos pueden ser indicadores de algún problema de salud. Por ejemplo, un perro que gruñe cuando le vas a tocar las orejas quizás sea un indicador de que pudiera tener alguna infección en el oído. ',
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
          'Intenta asear y peinar a tu perro con frecuencia: Es importante que aseemos a nuestro perro con frecuencia y dependiendo de la raza cuidar de su pelo peinándolo con frecuencia para evitar que se enrede y se creen nudos. La frecuencia de cepillado del perro depende mucho del tipo de pelo que tenga, algunos perros necesitarán ser cepillados una vez al día y otros una vez cada semana.',
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
          'Identifica a tu mascota: Si compartes tu vida con una mascota, hay dos tipos de identificación primordiales que puedes tener, los cuales son: Chapa de Identificación: ponle un collar o un arnés con una placa de identificación con su nombre, dirección y número de contacto. Aunque seas muy cuidadoso, ¡tu perro podría escaparse! Con un collar de identificación cualquier persona podría localizarte para devolvértelo. Recuerda también que el collar no debe de estar muy ajustado, ¡deben entrar dos dedos y deslizarse fácilmente!. Microchip de identificación: ¡Es fundamental! ¿Se lo puedes poner tú en casa? ¡No! El microchip se lo pondrá el veterinario. Hay muchísimos casos de perros que se han podido volver a su hogar, gracias a la identificación del microchip.',
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
          'En esta sección encontraras tips para tus perros.',
          textAlign: TextAlign.justify,
        ),
      ),
    );

  }

}