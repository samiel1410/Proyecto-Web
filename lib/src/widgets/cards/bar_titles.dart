/*import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pagosapp_group/services/expense_service.dart';
import 'package:pagosapp_group/src/models/expense_model.dart';

class BarTitles {
  
  ExpenseService _service = ExpenseService();
  List<Expense> _expense = [];
  
  static SideTitles getTopBottomTitles() => SideTitles(
        showTitles: true,
        getTextStyles: (context, value) =>
            const TextStyle(color: Colors.white, fontSize: 10),
        margin: 10,
        getTitles: (double id) => _expense.
            .name,
      );

  static SideTitles getSideTitles() {
    var expense = Expense();
    return SideTitles(
        showTitles: true,
        getTextStyles: (context, value) =>
            const TextStyle(color: Colors.white, fontSize: 10),
        rotateAngle: 90,
        interval: expense.intervalo.toDouble(),
        margin: 10,
        reservedSize: 30,
        getTitles: (double value) => value == 0 ? '0' : '${value.toInt()}k',
      );
  }
}
*/