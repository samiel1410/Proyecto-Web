// To parse this JSON data, do
//
//     final expenseType = expenseTypeFromJson(jsonString);

import 'dart:convert';

ExpenseType expenseTypeFromJson(String str) =>
    ExpenseType.fromJson(json.decode(str));

String expenseTypeToJson(ExpenseType data) => json.encode(data.toJson());

class ExpenseType {
  ExpenseType({
    required this.name,
    required this.description,
    required this.imagen,
  });

  String name;
  String description;
  String imagen;

  factory ExpenseType.fromJson(Map<String, dynamic> json) => ExpenseType(
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
