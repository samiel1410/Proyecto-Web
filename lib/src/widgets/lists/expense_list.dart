import 'package:flutter/material.dart';
import 'package:pagosapp_group/services/expense_service.dart';
import 'package:pagosapp_group/src/models/expense_model.dart';
import 'package:pagosapp_group/src/utils/standard_widgets.dart';
import 'package:pagosapp_group/src/widgets/cards/expense_card.dart';



class ExpenseList extends StatefulWidget {
  const ExpenseList({Key? key,}) : super(key: key);
  

  @override
  _ExpenseListtState createState() => _ExpenseListtState();
}

class _ExpenseListtState extends State<ExpenseList> {
  ExpenseService _service = ExpenseService();
  List<Expense> _expense = [];
  

  @override
  void initState() {
    super.initState();
    _loadIncome();
    //Imprimir los tipos de pago
  
  }

  @override
  Widget build(BuildContext context) {
    return _expense == null
        ? Standard.getBoard(context, "Descargando gastos", Icons.download)
        : _expense.length == 0
            ? Standard.getBoard(
                context, "No hay gastos registrados", Icons.no_accounts)
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: _expense
                        .map((e) => ExpenseCard(expe: e))
                        .toList()),
              );
  }

  _loadIncome() {
    _service.getPExpense().then((value) {
      _expense = value;
      setState(() {});
    });
  }

}
