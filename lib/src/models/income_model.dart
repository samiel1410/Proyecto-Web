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
    required this.image
    
  });

  Income.create(this.category, this.description, this.amount, this.date , this.image);

  String? idincome;
  String category;
  String description;
  int amount;
  DateTime date;
  String image;

  factory Income.fromJson(Map<String, dynamic> json) => Income(
        idincome: json['idincome'],
        category: json["category"],
        description: json["description"],
        amount: json["amount"],
        date: DateTime.parse(json["date"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "idincome": idincome,
        "category": category,
        "description": description,
        "amount": amount,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "image":image,
      };
}
