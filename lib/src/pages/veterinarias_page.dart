import 'package:flutter/material.dart';



class VeterinariasPage extends StatelessWidget {
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
            _crearTexto6(),
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
          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRUAtFIrz1Qhsmg9eDAV0VZgGWaIFFSHS7XnS87hrqW5PDYP4WD'),
          height: 330.0,
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
          'Caninos y Felinos                                    '+ 
          '            Dirección: Carrera 78 # 47 - 50, Medellín.' 
          '        Teléfono: +57-4 448 82 93.'+ 
          '                                   Horario de Atención: 7 días a la semana, 24 horas. Sitio Web: www.caninosyfelinos.com.co ',
    
        ),
      ),
    );

  }
   Widget _crearTexto2() {

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 40.0 ),
        child: Text(
          'Clínica Veterinaria El Poblado                                   '+ 
          '            Dirección: Calle 10A #  40 - 52, El Poblado, Medellín.' 
          '        Teléfono: +57-4 444 62 87.'+ 
          '                                   Horario de Atención: 7 días a la semana, 24 horas; Correo Electrónico: info@clinicaveterinariapoblado.com ',
        ),
      ),
    );

  }

  Widget _crearTexto3() {

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 40.0 ),
        child: Text(
          'Pet City                                  '+ 
          '                                 Dirección: Calle 38B Sur # 24 - 06, Envigado.' 
          '        Teléfono: +57-4 322 23 74 / +57 311 673 24 00 '+ 
          '                                    Horario de Atención: lunes a sábado, 9AM a 8PM / domingo, 9AM a 5PM. Sitio Web: www.petcity.com.co ',
        ),
      ),
    );



}

Widget _crearTexto4() {

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 40.0 ),
        child: Text(
           'Clínica Veterinaria Mascota Salud                                 '+ 
          '            Dirección: Carrera 40 # 64 - 02, Medellín.' 
          '        Teléfono: +57-4 254 50 41 / +57-4 254 50 21.'+ 
          '                                    Horario de Atención: lunes a domingo, 7AM a 9PM; Sitio Web: www.centroveterinariosaludanimal.com ',
        ),
      ),
    );

  }
  Widget _crearTexto5() {

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 40.0 ),
        child: Text(
           'Centro de Mascotas                                 '+ 
          '                                 Dirección: Calle 35 # 80B - 14, Laureles, Medellín.' 
          '        Teléfono: +57-4 413 17 39 /  +57 300 615 97 70. '+ 
          '                                     Horario de Atención: lunes a viernes, 7AM a 7PM / sábado, 7AM a 7:30PM; Sitio Web: www.centrodemascotas.com ',
        ),
      ),
    );

  }
  Widget _crearTexto6() {

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 40.0 ),
        child: Text(
        'Hoy en dia el cuidado de los animales que nos acompañan es algo muy importante para nosotros, por esta razón decidimos agregar algunos centros veterinarios, donde podras encontrar distintos beneficios. Cabe resaltar que estos son unos cuantos de los muchos que existen, esperamos que te pueda servir esta información. ',
        ),
      ),
    );

  }

}