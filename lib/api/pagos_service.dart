import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pagosapp_group/src/models/payment_model.dart';

class PagosService {
  PagosService();

  //Future, indica que es una llama asíncrona
  Future<List<Payment>> getPagoss() async {
    List<Payment> items = [];
    try {
      var uri = Uri.https('http:10.0.2.2:8000/apis/v1/', '');
      final resp = await http.get(uri);
      if (resp.body.isEmpty) return items;
      List<dynamic> jsonList = json.decode(resp.body);
      for (var item in jsonList) {
        final pagos = new Payment.fromJson(item);
        items.add(pagos);
      }
      return items;
    } on Exception catch (e) {
      print("Exception $e");
      return items;
    }
  }
}
