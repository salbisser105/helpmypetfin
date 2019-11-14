import 'package:flutter/material.dart';
import 'package:helpmypetfin/src/bloc/provider.dart';
import 'package:helpmypetfin/src/pages/anuncios_page.dart';
import 'package:helpmypetfin/src/pages/codigo_qr.dart';
import 'package:helpmypetfin/src/pages/despliegue_mapa_page.dart';
import 'package:helpmypetfin/src/pages/direcciones_page.dart';
import 'package:helpmypetfin/src/pages/encontrados_page.dart';
import 'package:helpmypetfin/src/pages/gatostips_page.dart';
import 'package:helpmypetfin/src/pages/login_page.dart';
import 'package:helpmypetfin/src/pages/mapa_page.dart';
import 'package:helpmypetfin/src/pages/newHome_page.dart';
import 'package:helpmypetfin/src/pages/noticias_page.dart';
import 'package:helpmypetfin/src/pages/perdidos_page.dart';
import 'package:helpmypetfin/src/pages/perrostips_page.dart';
import 'package:helpmypetfin/src/pages/qrreaderhome_page.dart';
import 'package:helpmypetfin/src/pages/registro_page.dart';
import 'package:helpmypetfin/src/pages/tips.dart';
import 'package:helpmypetfin/src/pages/veterinarias_page.dart';
import 'package:helpmypetfin/src/post/encontrados.dart';
import 'package:helpmypetfin/src/post/perdidos_post.dart';
import 'package:helpmypetfin/src/preferencias_usuario/preferencias_usuario.dart';

void main() async {

final prefs = new PreferenciasUsuario();

    await prefs.initPrefs();


 runApp(MyApp());
} 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final prefs = new PreferenciasUsuario();
    print(prefs.token);
    
    return Provider(
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Help My Pet ',
      home: LoginPage(),
      routes: {
        'login' : (BuildContext context ) =>LoginPage(),
        'codigoqr' : (BuildContext context ) =>CodigoQRPage(),
        'encontrados' : (BuildContext context ) =>EncontradosPage(),
        'perdidos' : (BuildContext context ) =>PerdidosPage(),
        'tips' : (BuildContext context ) =>TipsPage(),
        'encontradosA' : (BuildContext context ) =>EncontradosPageA(),
        'registro' : (BuildContext context ) =>RegistroPage(),
        'perdidosA' : (BuildContext context ) =>PerdidosPageA(),
        'mapa' : (BuildContext context ) =>MapaPage (),
        'qrreader' : (BuildContext context ) =>QrReaderHomePage (),
        'direcciones' : (BuildContext context ) =>DireccionesPage (),
        'mapadesp' : (BuildContext context ) =>MapaDPage (),
        'perrostips' : (BuildContext context ) =>PerrosTipsPage (),
        'gatostips' : (BuildContext context ) =>GatosTipsPage (),
        'nhomepage' : (BuildContext context ) => NHomePage(),
        'veterinarias' : (BuildContext context ) => VeterinariasPage(),
        'anuncios' : (BuildContext context ) => AnunciosPage(),
        'noticias' : (BuildContext context ) => NoticiasPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
    ),
    );

  }

}
