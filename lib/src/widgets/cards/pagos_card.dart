import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/models/expense_model.dart';

class PagosCard extends StatelessWidget {
  const PagosCard({Key? key, required this.currentPayment}) : super(key: key);
  final Expense currentPayment;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        /*title: Text(currentPayment.title),
        subtitle: Text(currentPayment.address),
        leading: Image.asset("assets/images/pago.png"),*/
      ),
    );
  }
}
