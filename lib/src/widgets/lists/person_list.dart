import 'package:flutter/material.dart';
import 'package:pagosapp_group/services/person_service.dart';
import 'package:pagosapp_group/src/models/person_model.dart';
import 'package:pagosapp_group/src/widgets/cards/person_card.dart';
import '';

class PersonList extends StatefulWidget {
  const PersonList({Key? key}) : super(key: key);

  @override
  _PersonListState createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  final PersonService _service = PersonService();
  List<Person> _persons = [];

  @override
  void initState() {
    super.initState();
    _loadPersons();
  }

  @override
  Widget build(BuildContext context) {
    return _persons.length == 0
        ? Container(
            child: Center(child: Text('Descargando Persones')),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children:
                    _persons.map((e) => PersonCard(currentPerson: e)).toList()),
          );
  }

  _loadPersons() {
    _service.getPerson().then((value) {
      _persons = value;
      setState(() {});
    });
  }
}
