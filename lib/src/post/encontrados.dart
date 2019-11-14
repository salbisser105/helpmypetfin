import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:helpmypetfin/src/models/encontrado_model.dart';
import 'package:helpmypetfin/src/providers/encontrado_provider.dart';



class EncontradosPageA extends StatefulWidget {

  @override
  _EncontradosPageAState createState() => _EncontradosPageAState();
}

class _EncontradosPageAState extends State<EncontradosPageA> {
  final formKey= GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final encontradoProvider = new EncontradoProvider();

  EncontradoModel encontrado = new EncontradoModel();
  bool _guardando = false;
  File fotoa;


  @override

  Widget build(BuildContext context) {

    final EncontradoModel  prodData = ModalRoute.of(context).settings.arguments;
    if ( prodData !=  null){
      encontrado= prodData;
    }
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Mascotas Encontradas'),
      actions: <Widget>[
        IconButton(
        icon: Icon(Icons.photo_size_select_actual),
        onPressed: _seleccionarFoto,
        ),
        IconButton(
          icon: Icon(Icons.camera_alt),
          onPressed: _tomarFoto,
        )
      ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _mostrarFoto(),
                _crearNombre(),
                _crearContacto(),
                _crearLugar(),
                _crearEstado(),
                _crearBoton(),
              ],
            ),
          ),
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );

  }


Widget _crearNombre(){

return TextFormField(
  initialValue: encontrado.nombre,
  textCapitalization: TextCapitalization.sentences,
  decoration: InputDecoration(
    labelText: 'Nombre mascota'
  ),
  onSaved: (value)=> encontrado.nombre= value,
  validator: (value){
    if (value.length <2 ){
      return 'Ingrese el nombre de la mascota';
    }else {
      return null;
    }
  },
);

}

Widget _crearBoton(){

return RaisedButton.icon(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0)
  ),
  color: Colors.blue,
  textColor: Colors.white,
  label: Text('Guardar'),
  icon: Icon( Icons.save),
  onPressed:(_guardando) ? null: _submit,
);

}

Widget _crearLugar() {

return TextFormField(
  initialValue: encontrado.lugar,
  textCapitalization: TextCapitalization.sentences,
  decoration: InputDecoration(
    labelText: 'Ubicación vista'
  ),
  onSaved: (value)=> encontrado.lugar= value,
  validator: (value){
    if (value.length <5 ){
      return 'Ingrese el lugar de donde fue vista la mascota.';
    }else {
      return null;
    }
  },
);

}

Widget _crearContacto(){

return TextFormField(
  initialValue: encontrado.contacto,
  textCapitalization: TextCapitalization.sentences,
  decoration: InputDecoration(
    labelText: 'Contacto de la persona'
  ),
  onSaved: (value)=> encontrado.contacto= value,
  validator: (value){
    if (value.length <6 ){
      return 'Ingrese un email o un numero de telefono.';
    }else {
      return null;
    }
  },
);

}

Widget _crearEstado(){

return SwitchListTile(
  value: encontrado.encontrado,
  title: Text ('Encontrado'),
  activeColor: Colors.blue,
  onChanged: (value)=> setState((){
    encontrado.encontrado =value;
  }),
);


}

void _submit()async{



  if(!formKey.currentState.validate()) return ;
    formKey.currentState.save();
   setState((){ _guardando = true;});

if (fotoa != null) {
  encontrado.fotoUrl = await encontradoProvider.subirImagen(fotoa);
}


if (encontrado.id == null) {
  encontradoProvider.crearEncontrado(encontrado);
}else {
  encontradoProvider.editarEncontrado(encontrado);
}

// setState((){ _guardando = false;});
mostrarSnackbar('Registro guardado');
Navigator.pop(context);
}

void mostrarSnackbar(String mensaje){

  final snackbar= SnackBar(
    content: Text(mensaje),
    duration: Duration(milliseconds: 1500),
  );

scaffoldKey.currentState.showSnackBar(snackbar);

}

_mostrarFoto(){
  if (encontrado.fotoUrl != null ){
    return FadeInImage(
      image:NetworkImage(encontrado.fotoUrl) ,
      placeholder: AssetImage('assets/jar-loading.gif'),
      height: 350.0,
      fit: BoxFit.fitWidth,
    );
  }else {
    //foto?.path?? pregunta si la foto ya esta, de lo contrario caarga el no image.
    return Image(
      image: AssetImage(fotoa?.path?? 'assets/no-image.png'),
      height: 350.0,
      fit: BoxFit.fitWidth,
    );
  }
}

_seleccionarFoto() async {
//Metodo para seleccionar la foto de la galeria.
_procesarImagen(ImageSource.gallery);
}

_tomarFoto() async {
//Metodo para tomar la foto con la camara.
  _procesarImagen( ImageSource.camera);

}

_procesarImagen(ImageSource origen) async {
//Metodo para escoger que foto se utilizara.
  fotoa = await ImagePicker.pickImage(
  source: origen
);

if(fotoa !=null ){
  //Limpieza para evitar problemas. 
 encontrado.fotoUrl = null;
}
setState(() {  });

}
}


