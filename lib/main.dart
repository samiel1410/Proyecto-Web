import 'package:flutter/material.dart';
//import 'package:pagosapp_group/src/pages/add_tarjeta.dart';
//import 'package:pagosapp_group/src/pages/home_page.dart';
import 'package:pagosapp_group/src/pages/main_page.dart';
//import 'package:pagosapp_group/src/pages/pago_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
      home: MainPage(),
    );
  }
}
