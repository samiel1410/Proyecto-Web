import 'package:flutter/material.dart';
//import 'package:pagosapp_group/services/payment_service.dart';
//import 'package:pagosapp_group/services/paymet1_service.dart';

//import 'package:pagosapp_group/src/models/payment_model.dart';
import 'package:pagosapp_group/src/models/person_model.dart';
//import 'package:pagosapp_group/src/widgets/cards/paymets_card.dart';

class PaymentsList1 extends StatefulWidget {
  const PaymentsList1({
    Key? key,
  }) : super(key: key);

  @override
  _PaymentsListState createState() => _PaymentsListState();
}

class _PaymentsListState extends State<PaymentsList1> {
  /*PaymentService _service = PaymentService();
  List<Payment> _payments = [];*/
  final Person? person = null;

  @override
  void initState() {
    super.initState();
    //_loadPayments();
    //Imprimir los tipos de pago
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text("HOlii")],
    );
  }
}
