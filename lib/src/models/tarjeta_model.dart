// To parse this JSON data, do
//
//     final tarjeta = tarjetaFromJson(jsonString);

import 'dart:convert';

Tarjeta tarjetaFromJson(String str) => Tarjeta.fromJson(json.decode(str));

String tarjetaToJson(Tarjeta data) => json.encode(data.toJson());

class Tarjeta {
    Tarjeta({
       required this.name,
       required this.idperson
    });

    String name;
    String idperson;

    
    factory Tarjeta.fromJson(Map<String, dynamic> json) => Tarjeta(
        name: json["name"],
        idperson: json["idperson"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "idperson": idperson,
    };
}
