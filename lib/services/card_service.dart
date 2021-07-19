import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pagosapp_group/src/models/tarjeta_model.dart';



class CardService {
  CardService();

  //Future, indica que es una llama asíncrona
  Future<List<Tarjeta>> getCard(String idperson) async {
    List<Tarjeta> items = [];
    try {
      var uri = Uri.https(
          "proyecto-5e4b9.web.app", "/api/cards/$idperson");
      final resp = await http.get(uri);
      if (resp.body.isEmpty) return items;
      List<dynamic> jsonList = json.decode(resp.body);
      for (var item in jsonList) {
        final card = new Tarjeta.fromJson(item);
        items.add(card);
      }
      return items;
    } on Exception catch (e) {
      print("Exception $e");
      return items;
    }
  }
}