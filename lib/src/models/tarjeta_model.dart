import 'dart:convert';

Tarjeta tarjetaFromJson(String str) => Tarjeta.fromJson(json.decode(str));

String tarjetaToJson(Tarjeta data) => json.encode(data.toJson());

class Tarjeta {
  Tarjeta({
    required this.bankinInstitution,
    required this.expiryDate,
    required this.ownerName,
    required this.creditMax,
    required this.numberCard,
  });

  String bankinInstitution;
  DateTime expiryDate;
  String ownerName;
  int creditMax;
  String numberCard;

  factory Tarjeta.fromJson(Map<String, dynamic> json) => Tarjeta(
        bankinInstitution: json["bankinInstitution"],
        expiryDate: DateTime.parse(json["expiryDate"]),
        ownerName: json["ownerName"],
        creditMax: json["creditMax"],
        numberCard: json["numberCard"],
      );

  Map<String, dynamic> toJson() => {
        "bankinInstitution": bankinInstitution,
        "expiryDate":
            "${expiryDate.day.toString().padLeft(4, '0')}-${expiryDate.month.toString().padLeft(2, '0')}-${expiryDate.year.toString().padLeft(2, '0')}",
        "ownerName": ownerName,
        "creditMax": creditMax,
        "numberCard": numberCard,
      };
}
