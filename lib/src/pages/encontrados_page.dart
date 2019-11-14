import 'package:flutter/material.dart';
import 'package:helpmypetfin/src/bloc/provider.dart';
import 'package:helpmypetfin/src/models/encontrado_model.dart';
import 'package:helpmypetfin/src/providers/encontrado_provider.dart';

class EncontradosPage extends StatelessWidget {
  final encontradoProvider = new EncontradoProvider();
  
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Mascotas encontradas'),
      ),
      body: _crearListado(),
      floatingActionButton: _crearBoton(context),

    );
  }

  Widget _crearListado(){

    return FutureBuilder(
      future: encontradoProvider.cargarEncontrados(),
      builder: (BuildContext context, AsyncSnapshot<List<EncontradoModel>> snapshot) {
        if (snapshot.hasData ){

          final encontrados = snapshot.data;
          return ListView.builder(
            itemCount: encontrados.length,
            itemBuilder: (context, i)=> _crearItem(context, encontrados[i]),
          );
        }else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );

  }

  Widget _crearItem(BuildContext context, EncontradoModel encontrados) {
    // Metodo para ver los items de las listas de encontrados en pantalla.
    return Dismissible(
      key: UniqueKey(),
       background: Container(
         color: Colors.red,
       ),
       //Metodo para Eliminar los productos de la app y la base de datos.
       onDismissed: (direccion ){
        //  encontradoProvider.borrarEncontrado(encontrados.id);
       },
          child: Card(
            child: Column(
              children: <Widget>[
                (encontrados.fotoUrl == null )
                ? Image(image: AssetImage('assets/no-image.png'),)
                : FadeInImage(
                  image: NetworkImage(encontrados.fotoUrl),
                  
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  height: 350.0,
                  width: double.infinity,
                  //Mirar este metodo para cuadrar la imagen como se vera.
                  fit: BoxFit.contain,
                ),               
                ListTile(
                   title: Text('${ encontrados.nombre} - ${encontrados.lugar} '),
                    onTap: () => Navigator.pushNamed(context, 'encontradosA', arguments: encontrados ),
                    ),
              ],
            ),
          )
    );

  }



_crearBoton(BuildContext context ) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
       new FloatingActionButton(
         heroTag: "add1",
         child: Icon(Icons.add),
    backgroundColor: Colors.blue,
    onPressed: ()=> Navigator.pushNamed(context, 'encontradosA'),
      ),
      Divider(height: 20.0),
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
}