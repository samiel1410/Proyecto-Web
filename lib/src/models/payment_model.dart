// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

Payment paymentFromJson(String str) => Payment.fromJson(json.decode(str));

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
  Payment(
      {this.idpayment,
      required this.title,
      required this.description,
      required this.amount,
      required this.address,
      required this.typePage,
      required this.date,
      required this.idperson});
  
   Payment.create(this.title, this.description,this.amount, this.idperson, this.date, this.address , this.typePage);

  String? idpayment;
  String title;
  String description;
  String amount;
  String address;
  String typePage;
  DateTime date;
  String idperson;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
      idpayment: json["idpayment"],
      title: json["title"],
      description: json["description"],
      amount: json["amount"],
      address: json["address"],
      typePage: json["typePage"],
      date: DateTime.parse(json["date"]),
      idperson: json["idperson"]);

  Map<String, dynamic> toJson() => {
        "idpayment": idpayment,
        "title": title,
        "description": description,
        "amount": amount,
        "address": address,
        "typePage": typePage,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "idperson": idperson,
      };
}
