//import 'package:js/js.dart';
import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/pages/barras_page.dart';
import 'package:pagosapp_group/src/widgets/lists/payments_one_list.dart';

//mport 'package:pagosapp_group/src/widgets/lists/paymets_list.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with 
SingleTickerProviderStateMixin{
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Gastos',),
    Tab(text: 'Ingresos'),
  ];
  
   late TabController _tabController;
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
    double _heigth = MediaQuery.of(context).size.height;
    print("Altura:$_heigth");

    return Scaffold(
    appBar: AppBar(
    bottom:TabBar(
      
          labelColor: Theme.of(context).canvasColor,
          controller: _tabController,
          tabs: myTabs),title:Text("Aplicacion")),
      body: TabBarView(
          controller: _tabController,
          children: [_gastos(), _ingresos()],
        ),
      
      
      
       
    );
  }
  _gastos(){
    double _heigth = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
          children: [
            SizedBox(
              height: _heigth * 0.4,
              child: Container(
                color: Colors.teal,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text("Pagos Pendientes",
                  style: Theme.of(context).textTheme.headline5),
              // ignore: deprecated_member_use
              RaisedButton(
                child: Icon(Icons.bar_chart_outlined),
                onPressed: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PieChartPage()));
                }
              )
            ]),
            //PaymentsList(idperson: 'IT3P9wP2ph065ese9ExW',)
            PaymentsList1()
          ],
        ),
    );

  }
  _ingresos(){
    return SingleChildScrollView(
      child: Column(
        children: [
         
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text("Ingresos",
                style: Theme.of(context).textTheme.headline5),
            // ignore: deprecated_member_use
         
          ]),
          //PaymentsList(idperson: 'IT3P9wP2ph065ese9ExW',)
          PaymentsList1()
        ],
      )
    );
  }
}
