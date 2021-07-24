import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:pagosapp_group/src/models/expense_type_model.dart';

class ExpenseTypeService {
  ExpenseTypeService();

  Future<List<ExpenseType>> getTypes() async =>
      rootBundle.loadString("assets/data/expense_type.json").then((data) {
        List<ExpenseType> items = [];
        List<dynamic> jsonList = json.decode(data);
        for (var item in jsonList) {
          final gasto = new ExpenseType.fromJson(item);
          items.add(gasto);
        }
        return items;
      });
}
