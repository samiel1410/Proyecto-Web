import 'package:flutter/material.dart';

import 'package:pagosapp_group/src/models/payment_model.dart';
import 'package:pagosapp_group/src/models/person_model.dart';
import 'package:pagosapp_group/src/utils/standard_widgets.dart';
import 'package:pagosapp_group/src/widgets/cards/paymets_card.dart';

class PaymentsList extends StatelessWidget {
  const PaymentsList({Key? key, required this.payments, required this.person})
      : super(key: key);
  final Person person;
  final List<Payment>? payments;

  @override
  Widget build(BuildContext context) {
    return payments == null
        ? Standard.getBoard(context, "Descargando tratamientos", Icons.download)
        : payments!.length == 0
            ? Standard.getBoard(
                context, "No hay tratamientos", Icons.no_accounts)
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
                child: Column(
                  children: payments!
                      .map((e) => PaymentCard(payment: e, person: person))
                      .toList(),
                ),
              );
  }
}
