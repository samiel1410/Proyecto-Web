import 'package:flutter/material.dart';
import 'package:pagosapp_group/services/paymet1_service.dart';



import 'package:pagosapp_group/src/models/payment_model.dart';
import 'package:pagosapp_group/src/widgets/cards/paymets1_card.dart';

class PaymentsList1 extends StatefulWidget {
  const PaymentsList1({Key? key,}) : super(key: key);
  

  @override
  _PaymentsListState createState() => _PaymentsListState();
}

class _PaymentsListState extends State<PaymentsList1> {
  PaymentService1 _service = PaymentService1();
  List<Payment> _payments = [];

  @override
  void initState() {
    super.initState();
    _loadPayments();
    //Imprimir los tipos de pago
  
  }

  @override
  Widget build(BuildContext context) {
    return _payments.length == 0
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Column(children: _payments.map((e) => PaymentCard1(pay: e)).toList());
  }

  _loadPayments() {
    _service.getPayament1().then((value) {
      _payments = value;
      setState(() {});
    });
  }

}
