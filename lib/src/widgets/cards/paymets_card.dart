import 'package:flutter/material.dart';

class PaymetCard extends StatelessWidget {
  const PaymetCard({Key? key, required this.img}) : super(key: key);
  final String img;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title:Text("Internet"),
        subtitle: Text("Pago en cnt"),
        leading: Image.asset("assets/images/" + img + ".png"),


      
      ),
    );
  }
}