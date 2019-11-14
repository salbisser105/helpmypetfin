

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
import 'package:helpmypetfin/src/models/encontrado_model.dart';
import 'package:helpmypetfin/src/preferencias_usuario/preferencias_usuario.dart';

class EncontradoProvider {

final String _url = 'https://help-my-pet.firebaseio.com';
final _prefs = new PreferenciasUsuario();

Future<bool>crearEncontrado(EncontradoModel encontrado) async {
  
  final url = '$_url/encontrados.json?auth=${ _prefs.token}';

  final resp = await http.post( url, body: encontradoModelToJson(encontrado) );

  final decodedData = json.decode(resp.body);

 print (decodedData);
 return true;
}

Future<List<EncontradoModel>> cargarEncontrados() async {

  final url = '$_url/encontrados.json?auth=${ _prefs.token}';
  final resp = await http.get(url);

  final Map<String, dynamic> decodedData = json.decode(resp.body);
  final List <EncontradoModel> encontrados= new List();
  if (decodedData == null ) return [];

  decodedData.forEach( (id, encontr){

    final prodTemp = EncontradoModel.fromJson(encontr);
    prodTemp.id = id;

  encontrados.add(prodTemp);

  });
  return encontrados;
}

//Metodo para editar un registro de la base de datos.

Future<bool>editarEncontrado(EncontradoModel encontrado) async {
  
  final url = '$_url/encontrados/${ encontrado.id}.json?auth=${ _prefs.token}';

  final resp = await http.put( url, body: encontradoModelToJson(encontrado) );

  final decodedData = json.decode(resp.body);

 print (decodedData);
 return true;
}
// Metodo para ELIMINAR el registro de la base de datos. ojo, no debe quedarse.
//Recomendación de la profesora debido a que es mejor llevar el registro.
// Future<int> borrarEncontrado(String id )async {

// final url= '$_url/encontrados/$id.json?auth=${ _prefs.token}';
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
  print('Algo salio mal');
  print(resp.body);
  return null;
}

final respData = json.decode(resp.body);
return respData['secure_url'];

}

}