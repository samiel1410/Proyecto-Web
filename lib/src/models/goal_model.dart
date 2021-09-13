// To parse this JSON data, do
//
//     final goal = goalFromJson(jsonString);

import 'dart:convert';

Goal goalFromJson(String str) => Goal.fromJson(json.decode(str));

String goalToJson(Goal data) => json.encode(data.toJson());

class Goal {
    Goal({
        this.id,
       required this.name,
       required this.credit,
    });

    int? id;
    String name;
    double credit;
  Goal.create(this.name,this.credit);
  

  
    factory Goal.fromJson(Map<String, dynamic> json) => Goal(
        id: json["id"],
        name: json["name"],
        credit: json["credit"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "credit": credit,
    };
}
