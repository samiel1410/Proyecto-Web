import 'package:flutter/material.dart';
import 'package:pagosapp_group/services/person_service.dart';
import 'package:pagosapp_group/src/models/person_model.dart';
import 'package:pagosapp_group/src/utils/standard_widgets.dart';
import 'package:pagosapp_group/src/widgets/cards/person_card.dart';


class PersonList extends StatefulWidget {
  const PersonList({Key? key}) : super(key: key);

  @override
  _PersonListState createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  final PersonService _service = PersonService();
  List<Person>? _persons = null;

  @override
  void initState() {
    super.initState();
    _loadPersons();
  }

  @override
  Widget build(BuildContext context) {
    return _persons == null
        ? Standard.getBoard(context, "Descargando usuarios", Icons.download)
        : _persons!.length == 0
            ? Standard.getBoard(
                context, "No hay pacientes registrados", Icons.no_accounts)
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: _persons!
                        .map((e) => PersonCard(currentPerson: e))
                        .toList()),
              );
  }

  _loadPersons() {
    _service.getPerson().then((value) {
      _persons = value;
      setState(() {});
    });
  }
}
