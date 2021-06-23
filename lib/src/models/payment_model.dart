// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

/*import 'dart:convert';

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
  });

  String title;
  String description;
  String amount;
  String? address;
  String? typePage;
  DateTime date;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        title: json["Title"],
        description: json["Description"],
        amount: json["Amount"],
        address: json["Address"],
        typePage: json["Type_Page"],
        date: DateTime.parse(json["Date"]),
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Description": description,
        "Amount": amount,
        "Address": address,
        "Type_Page": typePage,
        "Date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}*/

class Payment {
  final int id;
  final String title;
  final String description;
  final int amount;
  final String address;
  final String typePage;
  DateTime date;
  Payment(
      {required this.id,
      required this.title,
      required this.address,
      required this.amount,
      required this.date,
      required this.description,
      required this.typePage});

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      amount: json["amount"],
      address: json["adress"],
      typePage: json["typePage"],
      date: DateTime.parse(json["date"]),
    );
  }
  dynamic toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'amount': amount,
        'adress': address,
        'typePage': typePage,
        'date': date
      };
}
