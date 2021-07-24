import 'dart:convert';

Income incomeFromJson(String str) => Income.fromJson(json.decode(str));

String incomeToJson(Income data) => json.encode(data.toJson());

class Income {
  Income({
    this.idincome,
    required this.category,
    required this.description,
    required this.amount,
    required this.date,
  });

  Income.create(this.category, this.description, this.amount, this.date);

  String? idincome;
  String category;
  String description;
  String amount;
  DateTime date;

  factory Income.fromJson(Map<String, dynamic> json) => Income(
        idincome: json['idincome'],
        category: json["category"],
        description: json["description"],
        amount: json["amount"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "idincome": idincome,
        "category": category,
        "description": description,
        "amount": amount,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}
