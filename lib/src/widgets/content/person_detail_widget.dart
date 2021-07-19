import 'package:flutter/material.dart';
import 'package:pagosapp_group/services/card_service.dart';
import 'package:pagosapp_group/services/payment_service.dart';
import 'package:pagosapp_group/src/models/payment_model.dart';
import 'package:pagosapp_group/src/models/person_model.dart';
import 'package:pagosapp_group/src/models/tarjeta_model.dart';
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
  PaymentService _service = new PaymentService();
  CardService _serviceCard = new CardService();
  List<Payment>? _paymentList = null;
  List<Tarjeta>? _cardList = null;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    _loadPayment();
  
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
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Tooltip(
              message: "Agregar Pago",
              child: ElevatedButton(
                style: Standard.buttonStandardStyle(context),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentForm(
                            idperson: widget.person.idperson.toString()),
                      ));
                },
                child: const Icon(Icons.add),
              ),
            ),
            Tooltip(
              message: "Recargar lista",
              child: ElevatedButton(
                style: Standard.buttonStandardStyle(context),
                onPressed: () => _loadPayment(),
                child: const Icon(Icons.arrow_circle_down),
              ),
            ),
          ],
        ));
  }

  _loadPayment() {
    _service.getPayament(widget.person.idperson.toString()).then((value) {
      _paymentList = value;
      setState(() {});
    });
  }

  

  /* _detail() {
    return Column(
      children: [],
    );
  }
*/
  _detail() {
    return Container(
      margin: EdgeInsets.all(14.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Standard.getInfoLine(context, "Ciudad",
                widget.person.biography.toString(), Icons.location_city),
          ],
        ),
      ),
    );
  }

  _payments() {
    return SingleChildScrollView(
        child: PaymentsList(payments: _paymentList, person: widget.person));
  }
}
