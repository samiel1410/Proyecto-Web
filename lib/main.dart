import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
      home: MainPage()
    );
  }
}
