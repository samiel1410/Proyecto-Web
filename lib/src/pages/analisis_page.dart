import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:pagosapp_group/src/pages/sales.dart';


Future firebaseini() async{
  FirebaseApp initialization = await Firebase.initializeApp();
  return initialization;
}

Future firebase() async{
  final usuario =  FirebaseAuth.instance.currentUser!.email;
  return usuario;
}

class SalesHomePage extends StatefulWidget {
  @override
  _SalesHomePageState createState() {
    return _SalesHomePageState();
  }
}

class _SalesHomePageState extends State<SalesHomePage> {
   List<charts.Series<Sales, String>>? _seriesBarData;
   List<Sales>? mydata;
  CollectionReference coleccion = FirebaseFirestore.instance.collection('expense');
  _generateData(mydata) {
    _seriesBarData = <charts.Series<Sales, String>>[];
    _seriesBarData!.add(
      charts.Series(
        domainFn: (Sales sales, _) => sales.categori.toString(),
        measureFn: (Sales sales, _) => sales.amount,
        colorFn: (Sales sales, _) =>
            charts.ColorUtil.fromDartColor(Color(int.parse("0xff109618"))),
        id: 'Sales',
        data: mydata,
        labelAccessorFn: (Sales row, _) => "${row.categori}",
      ),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sales')),
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
          List<Sales> sales = snapshot.data!.docs
              .map((documentSnapshot) => Sales.fromMap(documentSnapshot.data() as Map<String,dynamic>))
              .toList();
          return _buildChart(context, sales);
        }
      },
    );
  }





  Widget _buildChart(BuildContext context, List<Sales> saledata) {
    mydata = saledata;
    _generateData(mydata);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Sales by Year',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: charts.BarChart(_seriesBarData!,
                    animate: true,
                    animationDuration: Duration(seconds:5),
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