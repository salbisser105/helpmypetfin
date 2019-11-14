
import 'dart:async';

import 'package:helpmypetfin/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators{






final _emailController = BehaviorSubject<String>();
final _claveController = BehaviorSubject<String>();



//Recuperar los datos del Stream
Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
Stream<String> get claveStream =>_claveController.stream.transform(validarClave);

Stream<bool> get formValidStream=> 
      Observable.combineLatest2(emailStream, claveStream, (e,p )=> true);

// Insertar valores al Stream. 
Function(String)get changeEmail => _emailController.sink.add;
Function(String)get changeClave => _claveController.sink.add;


//Obtener el ultimo valor ingresado a los streams.
String get email=> _emailController.value;
String get clave=> _claveController.value;

dispose(){
  _emailController?.close();
  _claveController?.close();
}


}