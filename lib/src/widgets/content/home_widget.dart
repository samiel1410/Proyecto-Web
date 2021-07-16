//import 'package:js/js.dart';
import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/models/person_model.dart';
import 'package:pagosapp_group/src/widgets/cards/paymets_card.dart';
import 'package:pagosapp_group/src/widgets/lists/cards_list.dart';
import 'package:pagosapp_group/src/widgets/lists/payments_list.dart';
import 'package:pagosapp_group/src/widgets/lists/payments_one_list.dart';

//mport 'package:pagosapp_group/src/widgets/lists/paymets_list.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    print("Altura:$_heigth");

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
            RaisedButton(
              child: Icon(Icons.add),
              onPressed: () {
                showAboutDialog(
                  context: context,
                  applicationIcon: FlutterLogo(),
                  applicationName: 'Woolha.com App',
                  applicationVersion: '0.0.1',
                  applicationLegalese: '©2020 Woolha.com',
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text('This is an about dialog in Flutter'))
                  ],
                );
              },
            )
          ]),
          //PaymentsList(idperson: 'IT3P9wP2ph065ese9ExW',)
          //PaymentsList1()
        ],
      ),
    );
  }
}
