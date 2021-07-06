import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/models/tarjeta_model.dart';



class TarjetaCard extends StatelessWidget {
  const TarjetaCard({Key? key, required this.tar}) : super(key: key);
  final Tarjeta tar;

  @override
  Widget build(BuildContext context) {
    
    return Card(
      child: ListTile(
        title: Text(tar.name),
        
      ),
    );
  }


}
