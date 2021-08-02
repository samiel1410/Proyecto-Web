import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/pages/forms/goal_form.dart';
import 'package:pagosapp_group/src/widgets/lists/goal_list.dart';


class GoalElementPage extends StatefulWidget {
  const GoalElementPage({Key? key}) : super(key: key);

  @override
  _GoalElementPageState createState() => _GoalElementPageState();
}

class _GoalElementPageState extends State<GoalElementPage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Formulario'),
    Tab(text: 'Listado'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        labelColor: Theme.of(context).primaryColor,
        controller: _tabController,
        tabs: myTabs,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [GoalElementForm(), GoalElementList()],
      ),
    );
  }
}
