// To parse this JSON data, do
//
//     final tarjeta = tarjetaFromJson(jsonString);

import 'dart:convert';

Tarjeta tarjetaFromJson(String str) => Tarjeta.fromJson(json.decode(str));

String tarjetaToJson(Tarjeta data) => json.encode(data.toJson());

class Tarjeta {
    Tarjeta({
       required this.name,
    });

    String name;

    factory Tarjeta.fromJson(Map<String, dynamic> json) => Tarjeta(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}
