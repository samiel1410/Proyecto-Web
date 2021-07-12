// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

Payment paymentFromJson(String str) => Payment.fromJson(json.decode(str));

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
  Payment({
    required this.title,
    required this.description,
    required this.amount,
    this.address,
    this.typePage,
    required this.date,
    required this.idperson,
  });

  String title;
  String description;
  String amount;
  String? address;
  String? typePage;
  DateTime date;
  String idperson;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        title: json["title"],
        description: json["description"],
        amount: json["amount"],
        address: json["address"],
        typePage: json["typePage"],
        date: DateTime.parse(json["date"]),
        idperson: json["idperson"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "amount": amount,
        "address": address,
        "typePage": typePage,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "idperson": "idperson",
      };
}
