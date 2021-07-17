import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/models/payment_model.dart';


class PaymentCard extends StatelessWidget {
  const PaymentCard({Key? key, required this.pay}) : super(key: key);
  final Payment pay;

  @override
  Widget build(BuildContext context) {
    
    return Card(
      child: ListTile(
        title: Text(pay.title),
        subtitle: Text(pay.description),
        leading: Icon(Icons.info),
      ),
    );
  }


}
