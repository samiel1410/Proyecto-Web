// To parse this JSON data, do
//
//     final expense = expenseFromJson(jsonString);

import 'dart:convert';

Expense expenseFromJson(String str) => Expense.fromJson(json.decode(str));

String expenseToJson(Expense data) => json.encode(data.toJson());

class Expense {
  Expense(
      {this.idexpense,
      required this.categori,
      required this.description,
      required this.amount,
      required this.date,
      required this.address,
      required this.image,
      this.photo});

  Expense.create(this.categori, this.description, this.amount, this.date,
      this.address, this.image);

  String? idexpense;
  String categori;
  String description;
  int amount;
  DateTime date;
  String address;
  String image;
  String? photo;

  factory Expense.fromJson(Map<String, dynamic> json) => Expense(
      idexpense: json["idexpense"],
      categori: json["categori"],
      description: json["description"],
      amount: json["amount"],
      date: DateTime.parse(json["date"]),
      address: json["address"],
      image: json["image"],
      photo: json["photo"]);

  Map<String, dynamic> toJson() => {
        "idexpense": idexpense,
        "categori": categori,
        "description": description,
        "amount": amount,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "address": address,
        "image": image,
        "photo": photo,
      };
}
