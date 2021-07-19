import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pagosapp_group/src/models/payment_model.dart';

class PaymentService {
  PaymentService();

  //Future, indica que es una llama asíncrona
  Future<List<Payment>> getPayament(String idperson) async {
    List<Payment> items = [];
    try {
      var uri = Uri.https("proyecto-5e4b9.web.app", "/api/payments/$idperson");
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



Future<dynamic> sendPayment(Payment payment) async {
    try {
      final Map<String, String> _headers = {"content-type": "application/json"};
      var uri =
          Uri.https("proyecto-5e4b9.web.app", "/api/payments");
      final resp = await http.post(uri,
          headers: _headers, body: paymentToJson(payment));
      if (resp.body.isEmpty) return null;
      return json.decode(resp.body);
    } on Exception catch (e) {
      print("Exception $e");
      return null;
    }
  }

}
