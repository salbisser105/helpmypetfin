import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
import 'package:helpmypetfin/src/models/perdido_model.dart';
import 'package:helpmypetfin/src/preferencias_usuario/preferencias_usuario.dart';

class PerdidoProvider {

final String _url = 'https://help-my-pet.firebaseio.com';
final _prefs = new PreferenciasUsuario();

Future<bool>crearPerdido(PerdidoModel perdidos) async {
  
  final url = '$_url/perdidos.json?auth=${ _prefs.token}';

  final resp = await http.post( url, body: perdidoModelToJson(perdidos) );

  final decodedData = json.decode(resp.body);

 print (decodedData);
 return true;
}

Future<List<PerdidoModel>> cargarPerdidos() async {

  final url = '$_url/perdidos.json?auth=${ _prefs.token}';
  final resp = await http.get(url);

  final Map<String, dynamic> decodedData = json.decode(resp.body);
  final List <PerdidoModel> perdidos= new List();
  if (decodedData == null ) return [];

  decodedData.forEach( (id, perdido){

    final prodTemp = PerdidoModel.fromJson(perdido);
    prodTemp.id = id;

  perdidos.add(prodTemp);

  });
  return perdidos;
}

//Metodo para editar un registro de la base de datos.

Future<bool>editarPerdido(PerdidoModel perdido) async {
  
  final url = '$_url/perdidos/${ perdido.id}.json?auth=${ _prefs.token}';

  final resp = await http.put( url, body: perdidoModelToJson(perdido) );

  final decodedData = json.decode(resp.body);

 print (decodedData);
 return true;
}
// Metodo para ELIMINAR el registro de la base de datos. ojo, no debe quedarse.
//Recomendación de la profesora debido a que es mejor llevar el registro.
// Future<int> borrarPerdido(String id )async {

// final url= '$_url/perdidos/$id.json?auth=${ _prefs.token}';
// final resp = await http.delete(url);

// return 1;

// }

//Metodo para subir la imagen a la base de datos, o cualquier tipo de archivo.
Future<String> subirImagen( File imagen) async {
  final url = Uri.parse('https://api.cloudinary.com/v1_1/dlotfx8zm/image/upload?upload_preset=vcmgct4k');
  final mimeType = mime(imagen.path).split('/');
  final imageUploadRequest = http.MultipartRequest(
    'POST',
    url
  );

final file = await http.MultipartFile.fromPath(
  'file', imagen.path, 
  contentType: MediaType(mimeType[0], mimeType[1])
  );
//Solo querremos subir uno de lo contrario agregar mas.
imageUploadRequest.files.add(file);

//Se dispara la peticion y se obtiene respuesta aca.
final streamResponse = await imageUploadRequest.send();
final resp = await http.Response.fromStream(streamResponse);

if( resp.statusCode !=200 && resp.statusCode != 201){
  // print('Algo salio mal');
  // print(resp.body);
  return null;
}

final respData = json.decode(resp.body);
return respData['secure_url'];

}

}