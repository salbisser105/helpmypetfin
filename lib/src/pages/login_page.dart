import 'package:flutter/material.dart';
import 'package:helpmypetfin/src/bloc/provider.dart';
import 'package:helpmypetfin/src/providers/usuario_provider.dart';
import 'package:helpmypetfin/src/utils/utils.dart';

class LoginPage extends StatelessWidget {

  final usuarioProvider = new UsuarioProvider();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
          _loginForm(context),
        ],
      )
    );
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;


    return SingleChildScrollView(
    child: Column(
      children: <Widget>[

        SafeArea(
          child: Container(
            height: 145.0,
          ),
        ),

        Container(
          width: size.width *0.85,
          padding: EdgeInsets.symmetric(vertical: 50.0),
          margin: EdgeInsets.symmetric(vertical: 30.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: <BoxShadow> [
              BoxShadow(
                color:  Colors.black26,
                blurRadius: 3.0,
                offset: Offset(0.0,5.0),
                spreadRadius: 3.0
              )
            ]
          ),
          child: Column(
            children: <Widget>[
              Text('Ingreso', style: TextStyle(fontSize:20.0 ),),
            SizedBox(height: 60.0),
            _crearEmail(bloc),
            SizedBox(height: 30.0,),
            _crearClave(bloc),
            SizedBox(height: 30.0,),
            _crearBoton(bloc),
            ],
          ),

        ),
        FlatButton(
          child: Text('Crear una nueva cuenta'),
          onPressed: ()=> Navigator.pushReplacementNamed(context, 'registro'),
        ),
        SizedBox(height: 70.0)
      ],
    ),
    );

  }

  Widget _crearEmail( LoginBloc bloc ){

    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot ){
        return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child:  TextField(
      keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
        icon: Icon(Icons.alternate_email, color: Colors.blue),
        hintText: 'ejemplo@hotmail.com',
        labelText: 'Correo electronico',
        errorText: snapshot.error
      ),
      onChanged: bloc.changeEmail,
      ),
    );
      },
    );


  }

   Widget _crearClave(LoginBloc bloc ){
     
     return StreamBuilder(
       stream: bloc.claveStream ,
       builder: (BuildContext context, AsyncSnapshot snapshot){
        

         return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child:  TextField(
        obscureText: true,
        decoration: InputDecoration(
        icon: Icon(Icons.lock, color: Colors.blue,),
        labelText: 'Contraseña',
        errorText: snapshot.error
        ),
        onChanged: bloc.changeClave,
      ),
    );
       },
     );

    
  }

  Widget _crearBoton(LoginBloc bloc ){

    return StreamBuilder(
      stream: bloc.formValidStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
        child: Text('Ingresar'),
      ),
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      elevation: 0.0,
      color: Colors.lightBlue,
      textColor: Colors.white,
      onPressed: snapshot.hasData ? ()=> _login(bloc, context): null
    );
      },
    );
  }

  _login(LoginBloc bloc, BuildContext context)async{
   Map info =await usuarioProvider.login(bloc.email, bloc.clave);
   
   if(info['ok']){
    Navigator.pushNamed(context,'nhomepage');
   }else {
     mostrarAlerta(context, 'Intente de nuevo' );
   }
  }

  Widget _crearFondo(BuildContext context){
    final size = MediaQuery.of(context).size;


    final fondoAzul= Container(
      height: size.height* 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:  <Color> [
            Color.fromRGBO(0, 136, 255, 0.6),
            Color.fromRGBO(0, 0, 0, 1.0)
          ]
        )
      ),
    );

  final circulo= Container(
    width: 80.0,
    height: 80.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100.0),
      color: Colors.white12
    ),
  );


  return Stack(
    children: <Widget>[
      fondoAzul,
      Positioned(top: 90.0, left: 30.0 , child: circulo,),
      Positioned(top: 90.0, right: 30.0 , child: circulo,),
      Positioned(top: 180.0, left: 60.0 , child: circulo,),
      Positioned(top: 180.0, right: 60.0 , child: circulo,),
      Positioned(top: 0.0, right: 0.0 , child: circulo,),
      Positioned(top: 0.0, left: 0.0 , child: circulo,),

    Container(
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        children: <Widget>[
          Icon(Icons.person_pin_circle,color: Colors.white, size: 100.0 ),
          SizedBox(height: 10.0, width: double.infinity,), 
          Text('Usuario', style: TextStyle(color: Colors.white, fontSize: 25.0),)
        ],
      ),
    )

    ],
  );



  }

}