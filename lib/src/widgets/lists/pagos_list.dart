import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:pagosapp_group/api/api.dart';
import 'package:pagosapp_group/src/widgets/cards/paymets_card.dart';

class PagosList extends StatefulWidget {
  @override
  _PagosListState createState() => _PagosListState();
}

class _PagosListState extends State<PagosList> {
  bool isLoading = false; //Variable para verificar si esta cargando los datos
  List<dynamic> pagosList = [];

  @override
  void initState() {
    getPagos();
    //super.initState();
  }

  void getPagos() async {
    final String url = 'http://10.0.2.2:8000/apis/v1/';
    http.Response response = await http.get(Uri.parse(url));
    String val = response.body;
    List<dynamic> data = jsonDecode(val);
    setState(() {
      data.forEach((value) {
        pagosList.add(value);
        //print(pagosList);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: pagosList.length,
            itemBuilder: (BuildContext context, int index) {
              return buildResultCard(pagosList[index]);
            },
          ),
        ]),
      ),
    );
  }
}

Widget buildResultCard(data) {
  return Card(
    child: ListTile(
      title: Text(data['title'] ?? ""),
      subtitle: Text(data['adress'] ?? ""),
      leading: Image.asset("assets/images/pago.png"),
    ),
  );
}
