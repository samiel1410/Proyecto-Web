//import 'package:js/js.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pagosapp_group/services/expense_service.dart';
import 'package:pagosapp_group/src/models/expense_model.dart';

import 'package:pagosapp_group/src/widgets/lists/expense_list.dart';
import 'package:pagosapp_group/src/widgets/lists/income_lits.dart';


class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with 

SingleTickerProviderStateMixin{
  final ExpenseService _service = ExpenseService();
  // ignore: avoid_init_to_null
  List<Expense>? _expense = null;
  Set<Marker> _markers = new Set();
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kCentroLatacunga = CameraPosition(
    target: LatLng(-0.9335863141754581, -78.61500222658208),
    zoom: 18,);

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Gastos',),
    Tab(text: 'Ingresos'),
  ];
  
   late TabController _tabController;
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    _loadExpenses();
  
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
      
          labelColor: Theme.of(context).selectedRowColor,
          controller: _tabController,
          tabs: myTabs),),
      body: TabBarView(
          controller: _tabController,
          children: [_gastos(), _ingresos()],
        ),
      
      
      
       
    );
  }
  _gastos(){
    double _heigth = MediaQuery.of(context).size.height;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        SizedBox(
            height: _heigth * 0.3,
            child: GoogleMap(
              markers: _markers,
              mapType: MapType.normal,
              initialCameraPosition: _kCentroLatacunga,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            )),
            SizedBox(height: 20.0),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text("Gastos Recientes",
                  style: Theme.of(context).textTheme.headline5),
              // ignore: deprecated_member_use
              
         
            ]),
            //PaymentsList(idperson: 'IT3P9wP2ph065ese9ExW',)
             Expanded(child: SingleChildScrollView(child: ExpenseList()))
            
          ],
        );
    

  }
  _ingresos(){
    return Scaffold(
      
        body: SingleChildScrollView(
          child: Column(
            children: [
                   Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text("Ingresos recientes",
                  style: Theme.of(context).textTheme.headline5),
              // ignore: deprecated_member_use
              
         
              
              
            ]),
              //PaymentsList(idperson: 'IT3P9wP2ph065ese9ExW',)
              IncomeList()
            ],
          )
        ),
     
        );
    
  }
   _loadExpenses() {
    _service.getPExpense().then((value) {
      _expense = value;
      _expense!.forEach((element) {
        if (element.georeference != null) {
          Marker mark = new Marker(
              markerId: MarkerId(element.description),
              infoWindow: InfoWindow(title: element.description + " " +'\$${element.amount.toString()}'),
              position: element.georeference!.getGeo());
          _markers.add(mark);
        }
      });

      if (mounted) {
        setState(() {});
      }
    });
  }
}

 

