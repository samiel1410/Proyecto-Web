// To parse this JSON data, do
//
//     final incomeType = incomeTypeFromJson(jsonString);

import 'dart:convert';

IncomeType incomeTypeFromJson(String str) =>
    IncomeType.fromJson(json.decode(str));

String incomeTypeToJson(IncomeType data) => json.encode(data.toJson());

class IncomeType {
  IncomeType({
    required this.name,
    required this.description,
  });

  String name;
  String description;

  factory IncomeType.fromJson(Map<String, dynamic> json) => IncomeType(
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
      };
}
