import 'package:flutter/material.dart';

import 'package:pagosapp_group/services/payment_service.dart';
import 'package:pagosapp_group/src/models/payment_model.dart';
import 'package:pagosapp_group/src/widgets/cards/paymets_card.dart';



class PaymentsList extends StatefulWidget {
  const PaymentsList({Key? key}) : super(key: key);

  @override
  _PaymentsListState createState() => _PaymentsListState();
}

class _PaymentsListState extends State<PaymentsList> {
  PaymentService _service = PaymentService();
  List<Payment> _payments = [];

  @override
  void initState() {
    super.initState();
    _loadPayments();
  }

  @override
  Widget build(BuildContext context) {
    return _payments.length == 0 ? Container(
      child: Center(child: CircularProgressIndicator(),
      ),
    ):
    Column(
      
        children:_payments.map((e) => PaymentCard(pay: e)).toList()
    
    );
  }

  _loadPayments() {
    _service.getPayament().then((value) {
      _payments= value;
      setState(() {});
    });
  }
}
