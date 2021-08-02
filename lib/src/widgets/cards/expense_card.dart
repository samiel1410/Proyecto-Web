import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/models/expense_model.dart';
import 'package:pagosapp_group/src/utils/standard_widgets.dart';


class ExpenseCard extends StatelessWidget {
  const ExpenseCard({Key? key, required this.expe}) : super(key: key);
  final Expense expe;

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: ()=> showMyDialog(context),
      child: Card(
        child: ListTile(
          title: Text(expe.categori),
          subtitle: Text(expe.description),
          leading: 
                 Image.asset("assets/images/" +
                          Standard.getFisioImage(expe.image) +
                          ".png"),
          trailing: Text('-\$${expe.amount}',  style: TextStyle(color:Colors.red  )),
        ),
      ),
    );
  }
Future<void> showMyDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(expe.categori + "\n" + "Ubicacion: "+ expe.address),
          content: expe.photo == null
          ?Container(child: Text("No hay ninguna foto"),)
          :Image.network(expe.photo.toString())
          
        );
      },
    );
  }


}
