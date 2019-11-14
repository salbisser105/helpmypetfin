import 'dart:convert';

EncontradoModel encontradoModelFromJson(String str) => EncontradoModel.fromJson(json.decode(str));

String encontradoModelToJson(EncontradoModel data) => json.encode(data.toJson());

class EncontradoModel {
    String id;
    String nombre;
    String contacto;
    String lugar;
    bool encontrado;
    String fotoUrl;

    EncontradoModel({
        this.id,
        this.nombre = '',
        this.contacto= '',
        this.lugar = '',
        this.encontrado = false,
        this.fotoUrl,
    });

    factory EncontradoModel.fromJson(Map<String, dynamic> json) => EncontradoModel(
        id        : json["id"],
        nombre    : json["nombre"],
        contacto  : json["contacto"],
        lugar     : json["lugar"],
        encontrado: json["encontrado"],
        fotoUrl   : json["fotoUrl"],
    );

    Map<String, dynamic> toJson() => {
        // "id"         : id,
        "nombre"     : nombre,
        "contacto"   : contacto,
        "lugar"      : lugar,
        "encontrado" : encontrado,
        "fotoUrl"    : fotoUrl,
    };
}