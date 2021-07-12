import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pagosapp_group/src/models/person_model.dart';

class PersonService {
  PersonService();

  //Future, indica que es una llama asíncrona
  Future<List<Person>> getPerson() async {
    List<Person> items = [];
    try {
      var uri = Uri.https("proyecto-5e4b9.web.app", "/api/persons/1/100");
      final resp = await http.get(uri);
      if (resp.body.isEmpty) return items;
      List<dynamic> jsonList = json.decode(resp.body);
      for (var item in jsonList) {
        final persona = new Person.fromJson(item);
        items.add(persona);
      }
      return items;
    } on Exception catch (e) {
      print("Exception $e");
      return items;
    }
  }
}
