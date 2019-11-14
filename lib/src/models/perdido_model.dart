import 'dart:convert';

PerdidoModel perdidoModelFromJson(String str) => PerdidoModel.fromJson(json.decode(str));

String perdidoModelToJson(PerdidoModel data) => json.encode(data.toJson());

class PerdidoModel {
    String id;
    String nombre;
    String contacto;
    String lugar;
    bool estado;
    String fotoUrl;

    PerdidoModel({
        this.id,
        this.nombre = '',
        this.contacto = '',
        this.lugar = '',
        this.estado = false,
        this.fotoUrl,
    });

    factory PerdidoModel.fromJson(Map<String, dynamic> json) => PerdidoModel(
        id: json["id"],
        nombre: json["nombre"],
        contacto: json["contacto"],
        lugar: json["lugar"],
        estado: json["estado"],
        fotoUrl: json["fotoUrl"],
    );

    Map<String, dynamic> toJson() => {
        // "id": id,
        "nombre": nombre,
        "contacto": contacto,
        "lugar": lugar,
        "estado": estado,
        "fotoUrl": fotoUrl,
    };
}