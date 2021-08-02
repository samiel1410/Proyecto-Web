import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/models/goal_model.dart';


import 'db_provider.dart';

class GoalElementProvider extends ChangeNotifier {
  List<Goal> elements = [];

  Future<Goal> addElement(String name, double credit) async {
    Goal element = Goal(name: name, credit: credit);
    final id = await DBProvider.db.insert(element);
    element.id = id;
    this.elements.add(element);
    notifyListeners();
    return element;
  }

  loadElements() async {
    final travelsQuery = await DBProvider.db.list();
    this.elements = [...travelsQuery];
    notifyListeners();
  }
}
