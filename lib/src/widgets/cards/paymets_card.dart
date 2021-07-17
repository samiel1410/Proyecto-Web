import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pagosapp_group/src/models/payment_model.dart';
import 'package:pagosapp_group/src/models/person_model.dart';
import 'package:pagosapp_group/src/pages/payment_page.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({Key? key, required this.payment, required this.person})
      : super(key: key);
  final Payment payment;
  final Person person;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PaymentPage(payment: payment, person: person)));
        },
        title:
            Text(payment.title, style: Theme.of(context).textTheme.bodyText1),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(DateFormat.yMMMd().format(payment.date),
              style: Theme.of(context).textTheme.caption),
        ),
        /*leading: ClipOval(
            child: Image.asset("assets/images/" +
                Standard.getFisioImage(payment.type) +
                ".png")),*/
      ),
    );
  }
}
