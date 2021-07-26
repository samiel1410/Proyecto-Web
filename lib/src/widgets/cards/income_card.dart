import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/models/income_model.dart';
import 'package:pagosapp_group/src/utils/standard_widgets.dart';


class IncomeCard extends StatelessWidget {
  const IncomeCard({Key? key, required this.inco}) : super(key: key);
  final Income inco;

  @override
  Widget build(BuildContext context) {
    
    return Card(
      child: ListTile(
        title: Text(inco.category),
        subtitle: Text(inco.description),
          leading: 
               Image.asset("assets/images/" +
                        Standard.getFisioImage(inco.image) +
                        ".png"),
        trailing: Text('+\$${inco.amount}', style: TextStyle(color:Colors.green  )),
      ),
    );
  }


}
