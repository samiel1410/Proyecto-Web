//import 'package:js/js.dart';
import 'package:flutter/material.dart';

import 'package:pagosapp_group/src/widgets/lists/pagos_list.dart';
import 'package:pagosapp_group/src/widgets/lists/payments_list.dart';
//mport 'package:pagosapp_group/src/widgets/lists/paymets_list.dart';
<<<<<<< HEAD
import 'package:provider/provider.dart';
=======

>>>>>>> 13a502274ee29ec75b46270236ec8ec992529bb5

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key}) : super(key: key);

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
<<<<<<< HEAD
          PagossList(),
=======
          PagosList(),
          
>>>>>>> 13a502274ee29ec75b46270236ec8ec992529bb5
        ],
      ),
    );
  }
}
