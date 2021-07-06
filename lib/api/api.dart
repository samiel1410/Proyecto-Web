import 'dart:convert';

import 'package:http/http.dart';
import 'package:pagosapp_group/src/models/payment_model.dart';

/*class PagosAppProvider with ChangeNotifier {
  PagosAppProvider() {
    this.fetchTasks();
  }

  List<Payment> _pagos = [];

  List<Payment> get pagos {
    return [..._pagos];
  }

  fetchTasks() async {
    final url = 'http://10.0.2.2:8000/apis/v1/?format=json';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _pagos = data.map<Payment>((json) => Payment.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Error al cargar los datos');
    }
  }
}*/

class PagosAppProvider {
  final String url = 'http://10.0.2.2:8000/apis/v1/?format=json';
  Client client = Client();
  Future<List<Payment>> fetchPosts() async {
    final response = await client.get(Uri.parse(url),headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "HEAD, GET, POST, PUT, PATCH, DELETE, OPTIONS",
        "Access-Control-Allow-Headers": "X-Requested-With"
      }) ;
    
    if (response.statusCode == 200) {
      print("SI SE PUEDE");
      final parsed = json.decode(response.body);
      return parsed.map<Payment>((json) => Payment.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar los datos');
    }
  }
}
