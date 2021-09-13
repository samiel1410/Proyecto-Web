import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pagosapp_group/services/expense_service.dart';
import 'package:pagosapp_group/src/models/expense_model.dart';
import 'package:pagosapp_group/src/widgets/cards/bar_chart_widget.dart';

class Chart extends StatelessWidget {
  final List<Expense> recentExpenses;
  Chart(this.recentExpenses);

  List<Map<String, Object>> get groupedExpenseValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (var i = 0; i < recentExpenses.length; i++) {
        if (recentExpenses[i].date.day == weekDay.day &&
            recentExpenses[i].date.month == weekDay.month &&
            recentExpenses[i].date.year == weekDay.year) {
          totalSum += recentExpenses[i].amount;
        }
      }

      return {'day': DateFormat('dd/MM').format(weekDay), 'amount': totalSum};
    }).reversed.toList();
  }

  double get maxSpending {
    return groupedExpenseValues.fold(0.0, (sum, item) {
      return (sum + item['amount'].hashCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return //Column(
        // children: <Widget>[
        Card(
      elevation: 6,
      margin: EdgeInsets.only(top: 20, right: 10, left: 10, bottom: 10),
      child: Container(
        padding: EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedExpenseValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  data['day'].toString(),
                  data['amount'].hashCode,
                  maxSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / maxSpending),
            );
          }).toList(),
        ),
      ),
    );
    // Text(
    //   'Gastos da Semana: \$${maxSpending.toStringAsFixed(2)}',
    //   style: Theme.of(context).textTheme.title,
    // ),
    // ],
    // );
  }
}
