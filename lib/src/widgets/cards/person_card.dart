import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/models/person_model.dart';
import 'package:pagosapp_group/src/pages/person_page.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({Key? key, required this.currentPerson}) : super(key: key);
  final Person currentPerson;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PersonPage(person: currentPerson),
            ));
      },
      title: Text(currentPerson.name,
          style: Theme.of(context).textTheme.headline6),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text((currentPerson.biography),
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold)),
      ),
      leading: ClipOval(
          child: currentPerson.photo == null
              ? Image.asset("images/icono_user.png")
              : Image.network(currentPerson.photo.toString())),
    ));
  }
}
