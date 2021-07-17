// To parse this JSON data, do
//
//     final person = personFromJson(jsonString);

import 'dart:convert';

import 'package:pagosapp_group/src/models/payment_model.dart';
import 'package:pagosapp_group/src/models/tarjeta_model.dart';

Person personFromJson(String str) => Person.fromJson(json.decode(str));

String personToJson(Person data) => json.encode(data.toJson());

class Person {
  Person({
    this.idperson,
    required this.name,
    required this.biography,
    this.photo,
    this.cards,
    //this.payments,
  });

  String name;
  String? idperson;
  String biography;
  String? photo;
  List<Tarjeta>? cards;
  // List<Payment>? payments;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        idperson: json["idperson"],
        name: json["name"],
        biography: json["biography"],
        photo: json["photo"],
        /*cards: List<Tarjeta>.from(
          json["cards"]?.map((x) => Tarjeta.fromJson(x))),
         payments:  List<Payment>.from(
          json["cards"]?.map((x) => Payment.fromJson(x))),*/
      );

  Map<String, dynamic> toJson() => {
        "idperson": idperson,
        "name": name,
        "biography": biography,
        "photo": photo,
        "cards": List<dynamic>.from(cards!.map((x) => x.toJson())),
        //"payments": List<dynamic>.from(payments!.map((x) => x.toJson())),
      };
}
