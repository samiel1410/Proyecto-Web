// To parse this JSON data, do
//
//     final paymentType = paymentTypeFromJson(jsonString);

import 'dart:convert';

PaymentType paymentTypeFromJson(String str) =>
    PaymentType.fromJson(json.decode(str));

String paymentTypeToJson(PaymentType data) => json.encode(data.toJson());

class PaymentType {
  PaymentType({
    required this.name,
    required this.description,
    required this.imagen,
  });

  String name;
  String description;
  String imagen;

  factory PaymentType.fromJson(Map<String, dynamic> json) => PaymentType(
        name: json["name"],
        description: json["description"],
        imagen: json["imagen"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "imagen": imagen,
      };
}
