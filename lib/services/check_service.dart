import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pagosapp_group/src/models/check_model.dart';

class CheckService {
  CheckService();

  //Future, indica que es una llama asíncrona
  Future<List<Check>> getCheck() async {
    List<Check> items = [];
    try {
      var uri = Uri.https("proyecto-5e4b9.web.app", "/api/checks/1/100");
      final resp = await http.get(uri);
      if (resp.body.isEmpty) return items;
      List<dynamic> jsonList = json.decode(resp.body);
      for (var item in jsonList) {
        final check = new Check.fromJson(item);
        items.add(check);
      }
      return items;
    } on Exception catch (e) {
      print("Exception $e");
      return items;
    }
  }

  Future<dynamic> sendCheck(Check check) async {
    try {
      final Map<String, String> _headers = {"content-type": "application/json"};
      var uri = Uri.https("proyecto-5e4b9.web.app", "/api/checks");
      final resp =
          await http.post(uri, headers: _headers, body: checkToJson(check));
      if (resp.body.isEmpty) return null;
      return json.decode(resp.body);
    } on Exception catch (e) {
      print("Exception $e");
      return null;
    }
  }
}
