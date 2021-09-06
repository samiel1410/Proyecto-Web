import 'package:flutter/material.dart';
import 'package:pagosapp_group/services/income_service.dart';
import 'package:pagosapp_group/src/models/income_model.dart';
import 'package:pagosapp_group/src/utils/standard_widgets.dart';
import 'package:pagosapp_group/src/widgets/cards/income_card.dart';


class IncomeList extends StatefulWidget {
  const IncomeList({Key? key,}) : super(key: key);
  

  @override
  _IncomeListtState createState() => _IncomeListtState();
}

class _IncomeListtState extends State<IncomeList> {
  IncomeService _service = IncomeService();
  List<Income> _income = [];
  

  @override
  void initState() {
    super.initState();
    _loadIncome();
    
    //Imprimir los tipos de pago
  
  }

  @override
  Widget build(BuildContext context) {
    return _income== null
        ? Standard.getBoard(context, "Descargando ingresos", Icons.download)
        : _income.length == 0
            ? Standard.getBoard(
                context, "No hay ingresos registrados", Icons.no_accounts)
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: _income
                        .map((e) => IncomeCard(inco: e))
                        .toList()),
              );
  }

  _loadIncome() {
    _service.getIncome().then((value) {
      _income = value;
       if (mounted) {
        setState(() {});
      }
    });
  }

}
