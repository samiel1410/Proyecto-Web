import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pagosapp_group/src/models/tarjeta_model.dart';

class CardService {
  CardService();

  //Future, indica que es una llama asíncrona
  Future<List<Tarjeta>> getCard() async {
    List<Tarjeta> items = [];
    try {
      var uri = Uri.https("proyecto-5e4b9.web.app", "/api/cards/1/100");
      final resp = await http.get(uri);
      if (resp.body.isEmpty) return items;
      List<dynamic> jsonList = json.decode(resp.body);
      for (var item in jsonList) {
        final tarjeta = new Tarjeta.fromJson(item);
        items.add(tarjeta);
      }
      return items;
    } on Exception catch (e) {
      print("Exception $e");
      return items;
    }
  }

  Future<dynamic> sendCard(Tarjeta card) async {
    try {
      final Map<String, String> _headers = {"content-type": "application/json"};
      var uri = Uri.https("proyecto-5e4b9.web.app", "/api/cards");
      final resp =
          await http.post(uri, headers: _headers, body: tarjetaToJson(card));
      if (resp.body.isEmpty) return null;
      return json.decode(resp.body);
    } on Exception catch (e) {
      print("Exception $e");
      return null;
    }
  }
}
