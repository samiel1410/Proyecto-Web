import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pagosapp_group/src/models/payment_model.dart';

class PaymentService1 {
  PaymentService1();

  //Future, indica que es una llama asíncrona
  Future<List<Payment>> getPayament1() async {
    List<Payment> items = [];
    try {
      var uri = Uri.https("proyecto-5e4b9.web.app", "/api/payments/1/100");
      final resp = await http.get(uri);
      if (resp.body.isEmpty) return items;
      List<dynamic> jsonList = json.decode(resp.body);
      for (var item in jsonList) {
        final paciente = new Payment.fromJson(item);
        items.add(paciente);
      }
      return items;
    } on Exception catch (e) {
      print("Exception $e");
      return items;
    }
  }
}
