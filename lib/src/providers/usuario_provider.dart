import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:helpmypetfin/src/preferencias_usuario/preferencias_usuario.dart';

class UsuarioProvider  {

  final String _firebaseToken = 'AIzaSyAjehoAnmi4HlwPf4966pTWhKn_rDZW0bA ';
  final _prefs = new PreferenciasUsuario();
  
  Future<Map<String, dynamic>> login (String email, String password)async {
    final authData = {
  'email' : email,
  'password' : password,
  'returnSecureToken' : true
};

final resp = await http.post(
'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
body: json.encode(authData)

);

Map<String, dynamic> decodedResp= json.decode(resp.body);
print(decodedResp);

 if(decodedResp.containsKey('idToken') ){

   _prefs.token= decodedResp['idToken'];
//Salvar el token en el storage.
  return { 'ok' : true, 'token':decodedResp['idToken']};
 }else {
   //['message'] 
   return {'ok': false, 'mensaje':decodedResp['error']['message']};
 }
}
  

//Crear Usuario
Future<Map<String, dynamic>> nuevoUsuario( String email, String password) async {

final authData = {
  'email' : email,
  'password' : password,
  'returnSecureToken' : true
};

final resp = await http.post(
'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
body: json.encode(authData)

);

Map<String, dynamic> decodedResp= json.decode(resp.body);
print(decodedResp);

 if(decodedResp.containsKey('idToken') ){

_prefs.token= decodedResp['idToken'];
//Salvar el token en el storage.

  return { 'ok' : true, 'token':decodedResp['idToken']};
 }else {
   //['message'] 
   return { 'ok': false, 'mensaje':decodedResp['error']};
 }

}


}