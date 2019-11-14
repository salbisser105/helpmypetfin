// import 'dart:convert';

// ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

// String scanModelToJson(ScanModel data) => json.encode(data.toJson());

import 'package:latlong/latlong.dart';

class ScanModel {
    int id;
    String tipo;
    String valor;

    ScanModel({
        this.id,
        this.tipo,
        this.valor,
    }){
      if (this.valor.contains('http')){
        this.tipo = 'http';
      }else {
        this.tipo = 'geo';
      }
    }
    //Factory permite crear una nueva instancia.
    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id   : json["id"],
        tipo : json["tipo"],
        valor: json["valor"],
    );
    // Retorna un objeto del mismo tipo. 
    Map<String, dynamic> toJson() => {
        "id"     : id,
        "tipo"   : tipo,
        "valor"  : valor,
    };

  LatLng getLatLng(){

    final lalo = valor.substring(4).split(',');
    final lat = double.parse(lalo[0]);
    final lng = double.parse(lalo[1]);

    return LatLng( lat, lng);

  }

}
