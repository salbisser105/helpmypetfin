import 'package:flutter/material.dart';
import 'package:helpmypetfin/src/bloc/provider.dart';
import 'package:helpmypetfin/src/models/perdido_model.dart';
import 'package:helpmypetfin/src/providers/perdido_provider.dart';

class PerdidosPage extends StatelessWidget {
  final perdidoProvider = new PerdidoProvider();
  
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Mascotas Desaparecidas'),
      ),
      body: _crearListado(),
      floatingActionButton: _crearBoton(context),

    );
  }

  Widget _crearListado(){

    return FutureBuilder(
      future: perdidoProvider.cargarPerdidos(),
      builder: (BuildContext context, AsyncSnapshot<List<PerdidoModel>> snapshot) {
        if (snapshot.hasData ){

          final estado = snapshot.data;
          return ListView.builder(
            itemCount: estado.length,
            itemBuilder: (context, i)=> _crearItem(context, estado[i]),
          );
        }else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );

  }

  Widget _crearItem(BuildContext context, PerdidoModel perdidos) {
    // Metodo para ver los items de las listas de perdidos en pantalla.
    return Dismissible(
      key: UniqueKey(),
       background: Container(
         color: Colors.red,
       ),
       //Metodo para Eliminar los productos de la app y la base de datos.
       onDismissed: (direccion ){
        //  perdidoProvider.borrarPerdido(perdidos.id);
       },
          child: Card(
            child: Column(
              children: <Widget>[
                (perdidos.fotoUrl == null )
                ? Image(image: AssetImage('assets/no-image.png'),)
                : FadeInImage(
                  image: NetworkImage(perdidos.fotoUrl),
                  
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  height: 350.0,
                  width: double.infinity,
                  //Mirar este metodo para cuadrar la imagen como se vera.
                  fit: BoxFit.contain,
                ),               
                ListTile(
                   title: Text('${ perdidos.nombre} - ${perdidos.lugar} '),
                    onTap: () => Navigator.pushNamed(context, 'perdidosA', arguments: perdidos ),
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
    onPressed: ()=> Navigator.pushNamed(context, 'perdidosA'),
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