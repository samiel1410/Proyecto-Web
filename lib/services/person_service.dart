import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
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

  Future<dynamic> sendPerson(Person person) async {
    try {
      final Map<String, String> _headers = {"content-type": "application/json"};
      var uri = Uri.https("proyecto-5e4b9.web.app", "/api/persons");
      String personJson = personToJson(person);
      final resp = await http.post(uri, headers: _headers, body: personJson);
      if (resp.body.isEmpty) return null;
      return json.decode(resp.body);
    } on Exception catch (e) {
      print("Exception $e");
      return null;
    }
  }

  Future<String> uploadImage(File image) async {
    final cloudinary = CloudinaryPublic('da02ifn7j', 'wpbfck1t', cache: false);
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image.path,
            resourceType: CloudinaryResourceType.Image),
      );

      return response.secureUrl;
    } on CloudinaryException catch (e) {
      print(e.message);
      print(e.request);
      print("NO SE CARGO A CLOUDINARY");
      return "";
    }
  }
}
