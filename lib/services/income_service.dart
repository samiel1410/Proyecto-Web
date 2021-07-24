import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pagosapp_group/src/models/income_model.dart';

class IncomeService {
  IncomeService();

  //Future, indica que es una llama asíncrona
  Future<List<Income>> getIncome() async {
    List<Income> items = [];
    try {
      var uri = Uri.https("proyecto-5e4b9.web.app", "/api/incomes/1/100");
      final resp = await http.get(uri);
      if (resp.body.isEmpty) return items;
      List<dynamic> jsonList = json.decode(resp.body);
      for (var item in jsonList) {
        final incomea = new Income.fromJson(item);
        items.add(incomea);
      }
      return items;
    } on Exception catch (e) {
      print("Exception $e");
      return items;
    }
  }

  Future<dynamic> sendIncome(Income income) async {
    try {
      final Map<String, String> _headers = {"content-type": "application/json"};
      var uri = Uri.https("proyecto-5e4b9.web.app", "/api/incomes");
      String incomeJson = incomeToJson(income);
      final resp = await http.post(uri, headers: _headers, body: incomeJson);
      if (resp.body.isEmpty) return null;
      return json.decode(resp.body);
    } on Exception catch (e) {
      print("Exception $e");
      return null;
    }
  }
}
