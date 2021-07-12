//import 'package:js/js.dart';
import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/models/person_model.dart';
import 'package:pagosapp_group/src/widgets/lists/payments_list.dart';

//mport 'package:pagosapp_group/src/widgets/lists/paymets_list.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key, required this.person}) : super(key: key);
  final Person person;

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    print("Altura:$_heigth");

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: _heigth * 0.4,
            child: Container(
              color: Colors.teal,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text("Pagos Pendientes",
              style: Theme.of(context).textTheme.headline5),
          PaymentsList(idperson: widget.person.idperson)
        ],
      ),
    );
  }
}
