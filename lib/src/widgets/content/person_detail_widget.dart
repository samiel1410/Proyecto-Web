import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/models/person_model.dart';
import 'package:pagosapp_group/src/pages/pago_form.dart';
import 'package:pagosapp_group/src/utils/standard_widgets.dart';
import 'package:pagosapp_group/src/widgets/lists/payments_list.dart';

class PersonDetailWidget extends StatefulWidget {
  PersonDetailWidget({Key? key, required this.person}) : super(key: key);

  final Person person;
  @override
  _PersonDetailWidgetState createState() => _PersonDetailWidgetState();
}

class _PersonDetailWidgetState extends State<PersonDetailWidget>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Detalles'),
    Tab(text: 'Pagos'),
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
        children: [_detail(), _payments()],
      ),
    );
  }

  _detail() {
    return Column(
      children: [],
    );
  }

  _payments() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Tooltip(
            message: "Agregar nuevo",
            child: ElevatedButton(
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PagoPage(),
                    ))
              },
              child: Icon(Icons.add_circle_rounded),
              style: Standard.BtnStyle(context),
            ),
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
                child: PaymentsList(idperson: "IT3P9wP2ph065ese9ExW")))
      ],
    );
  }
}
