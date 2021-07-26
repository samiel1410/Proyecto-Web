import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pagosapp_group/src/models/expense_model.dart';
import 'package:pagosapp_group/src/utils/standard_widgets.dart';

class PaymentDetailsWidget extends StatefulWidget {
  const PaymentDetailsWidget(
      {Key? key, required this.payment})
      : super(key: key);
  final Expense payment;


  @override
  _PaymentDetailsWidgetState createState() => _PaymentDetailsWidgetState();
}

class _PaymentDetailsWidgetState extends State<PaymentDetailsWidget>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Detalles'),
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
        children: [_detail()],
      ),
    );
  }

  _detail() {
    return Container(
      margin: EdgeInsets.all(14.0),
      child: Center(
        child: ListView(
        
          children: [
            
            Standard.getInfoLine(
                context,
                "Fecha de inicio",
                DateFormat.yMMMd().format(widget.payment.date),
                Icons.calendar_today),
            Standard.getInfoLine(
                context, "Monto", widget.payment.amount, Icons.person),
            Standard.getInfoLine(context, "Descripcion",
                widget.payment.description, Icons.person),
            Standard.getInfoLine(
                context, "Direccion", widget.payment.address, Icons.person),
          
          ],
        ),
      ),
    );
  }
}
