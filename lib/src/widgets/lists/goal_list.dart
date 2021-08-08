import 'package:flutter/material.dart';
import 'package:pagosapp_group/providers/goal_elements.dart';
import 'package:provider/provider.dart';


class GoalElementList extends StatefulWidget {
  GoalElementList({Key? key}) : super(key: key);

  @override
  _GoalElementListState createState() => _GoalElementListState();
}

class _GoalElementListState extends State<GoalElementList> {
  @override
  Widget build(BuildContext context) {
    final goalProvider =
        Provider.of<GoalElementProvider>(context, listen: false);
    goalProvider.loadElements();

    return goalProvider.elements.length == 0
        ? Center(
            child: Container(
                height: 100, width: 100, child: CircularProgressIndicator()))
        : ListView.builder(
            shrinkWrap: true,
            itemCount: goalProvider.elements.length,
            itemBuilder: (_, index) => Card(
                child: ListTile(
                    leading: Icon(Icons.emoji_events_outlined),
                    title: Text(goalProvider.elements[index].name),
                    trailing: Text(goalProvider.elements[index].credit.toString()) 
        )));
  }
}
