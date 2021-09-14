import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:pagosapp_group/src/pages/expenses.dart';

Future firebaseini() async {
  FirebaseApp initialization = await Firebase.initializeApp();
  return initialization;
}

Future firebase() async {
  final usuario = FirebaseAuth.instance.currentUser!.email;
  return usuario;
}

class ExpensesHomePage extends StatefulWidget {
  @override
  _ExpensesHomePageState createState() {
    return _ExpensesHomePageState();
  }
}

class _ExpensesHomePageState extends State<ExpensesHomePage> {
  List<charts.Series<Expenses, String>>? _seriesBarData;
  List<Expenses>? mydata;
  CollectionReference coleccion =
      FirebaseFirestore.instance.collection('expense');
  _generateData(mydata) {
    _seriesBarData = <charts.Series<Expenses, String>>[];
    _seriesBarData!.add(
      charts.Series(
        domainFn: (Expenses sales, _) => sales.categori.toString(),
        measureFn: (Expenses sales, _) => sales.amount,
        colorFn: (Expenses sales, _) =>
            charts.ColorUtil.fromDartColor(Color(int.parse(sales.color))),
        id: 'Expenses',
        data: mydata,
        labelAccessorFn: (Expenses row, _) => "${row.categori}",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gastos')),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: coleccion.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<Expenses> sales = snapshot.data!.docs
              .map((documentSnapshot) => Expenses.fromMap(
                  documentSnapshot.data() as Map<String, dynamic>))
              .toList();
          return _buildChart(context, sales);
        }
      },
    );
  }

  Widget _buildChart(BuildContext context, List<Expenses> saledata) {
    mydata = saledata;
    _generateData(mydata);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Gastos Anuales',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: charts.BarChart(
                  _seriesBarData!,
                  animate: true,
                  animationDuration: Duration(seconds: 5),
                  behaviors: [
                    new charts.DatumLegend(
                      entryTextStyle: charts.TextStyleSpec(
                          color: charts.MaterialPalette.purple.shadeDefault,
                          fontFamily: 'Georgia',
                          fontSize: 18),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
