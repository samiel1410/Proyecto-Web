import 'package:flutter/material.dart';

import 'package:pagosapp_group/services/payment_service.dart';
import 'package:pagosapp_group/services/payment_type_service.dart';
import 'package:pagosapp_group/src/models/payment_model.dart';
import 'package:pagosapp_group/src/widgets/cards/paymets_card.dart';

class PaymentsList extends StatefulWidget {
  const PaymentsList({Key? key, required this.idperson}) : super(key: key);
  final String idperson;

  @override
  _PaymentsListState createState() => _PaymentsListState();
}

class _PaymentsListState extends State<PaymentsList> {
  PaymentService _service = PaymentService();
  PaymentTypeService _services = PaymentTypeService();
  List<Payment> _payments = [];

  @override
  void initState() {
    super.initState();
    _loadPayments();
    //Imprimir los tipos de pago
    _loadPaymentsType();
  }

  @override
  Widget build(BuildContext context) {
    return _payments.length == 0
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Column(children: _payments.map((e) => PaymentCard(pay: e)).toList());
  }

  _loadPayments() {
    _service.getPayament(widget.idperson).then((value) {
      _payments = value;
      setState(() {});
      //print(_payments);
    });
  }

  _loadPaymentsType() {
    _services.getTypes().then((value) => print(value));
  }
}
