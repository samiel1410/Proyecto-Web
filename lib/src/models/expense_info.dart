// To parse this JSON data, do
//
//     final expenseInfo = expenseInfoFromJson(jsonString);

import 'dart:convert';

ExpenseInfo expenseInfoFromJson(String str) => ExpenseInfo.fromJson(json.decode(str));

String expenseInfoToJson(ExpenseInfo data) => json.encode(data.toJson());

class ExpenseInfo {
    ExpenseInfo({
        this.categori,
        this.amount,
    });

    String? categori;
    int? amount;

    factory ExpenseInfo.fromJson(Map<String, dynamic> json) => ExpenseInfo(
        categori: json["categori"],
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "categori": categori,
        "amount": amount,
    };
}
