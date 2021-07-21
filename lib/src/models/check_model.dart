import 'dart:convert';

Check checkFromJson(String str) => Check.fromJson(json.decode(str));

String checkToJson(Check data) => json.encode(data.toJson());

class Check {
  Check({
    required this.bankinInstitution,
    required this.numberCheck,
    required this.ownerName,
    required this.checkIdentification,
  });

  Check.create(this.bankinInstitution, this.numberCheck, this.ownerName,
      this.checkIdentification);

  String bankinInstitution;
  String numberCheck;
  String ownerName;
  String checkIdentification;

  factory Check.fromJson(Map<String, dynamic> json) => Check(
        bankinInstitution: json["bankinInstitution"],
        numberCheck: json["numberCheck"],
        ownerName: json["ownerName"],
        checkIdentification: json["checkIdentification"],
      );

  Map<String, dynamic> toJson() => {
        "bankinInstitution": bankinInstitution,
        "numberCheck": numberCheck,
        "ownerName": ownerName,
        "checkIdentification": checkIdentification,
      };
}
