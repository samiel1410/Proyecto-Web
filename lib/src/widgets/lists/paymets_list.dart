import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/widgets/cards/paymets_card.dart';

class PaymetList extends StatelessWidget {
  const PaymetList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymetCard(img: "icono_internet"),
        PaymetCard(img: "icono_internet")
      ],
    
    );
  }
}