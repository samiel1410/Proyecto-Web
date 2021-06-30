import 'package:flutter/material.dart';
import 'package:pagosapp_group/api/pagos_service.dart';
import 'package:pagosapp_group/src/models/payment_model.dart';

import 'package:pagosapp_group/src/widgets/cards/pagos_card.dart';

class PagossList extends StatefulWidget {
  const PagossList({Key? key}) : super(key: key);

  @override
  _PagossListState createState() => _PagossListState();
}

class _PagossListState extends State<PagossList> {
  final PagosService _service = PagosService();
  List<Payment> _payments = [];

  @override
  void initState() {
    super.initState();
    _loadPayments();
  }

  @override
  Widget build(BuildContext context) {
    return _payments.length == 0
        ? Container(
            child: Center(child: Text('Descargando pacientes')),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: _payments
                    .map((e) => PagosCard(currentPayment: e))
                    .toList()),
          );
  }

  _loadPayments() {
    _service.getPagoss().then((value) {
      _payments = value;
      setState(() {});
    });
  }
}
