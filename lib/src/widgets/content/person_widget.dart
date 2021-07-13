import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/widgets/lists/person_list.dart';

class PersonWidget extends StatefulWidget {
  PersonWidget({Key? key}) : super(key: key);

  @override
  _PersonWidgetState createState() => _PersonWidgetState();
}

class _PersonWidgetState extends State<PersonWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: PersonList());
  }
}
