import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:pagosapp_group/src/models/income_type_model.dart';

class IncomeTypeService {
  IncomeTypeService();

  Future<List<IncomeType>> getTypes() async =>
      rootBundle.loadString("assets/data/income_type.json").then((data) {
        List<IncomeType> items = [];
        List<dynamic> jsonList = json.decode(data);
        for (var item in jsonList) {
          final gasto = new IncomeType.fromJson(item);
          items.add(gasto);
        }
        return items;
      });
}
