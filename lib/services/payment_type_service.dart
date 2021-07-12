import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:pagosapp_group/src/models/payment_type_model.dart';

class PaymentTypeService {
  PaymentTypeService();

  Future<List<PaymentType>> getTypes() async =>
      rootBundle.loadString("assets/data/payment_type.json").then((data) {
        List<PaymentType> items = [];
        List<dynamic> jsonList = json.decode(data);
        for (var item in jsonList) {
          final pago = new PaymentType.fromJson(item);
          items.add(pago);
        }
        return items;
      });
}
