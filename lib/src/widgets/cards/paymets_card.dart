import 'package:flutter/material.dart';
import 'package:pagosapp_group/api/api.dart';
import 'package:provider/provider.dart';

class PaymetCard extends StatelessWidget {
  const PaymetCard({Key? key, required this.img}) : super(key: key);
  final String img;

  @override
  Widget build(BuildContext context) {
    final pagosP = Provider.of<PagosAppProvider>(context);
    return Card(
      child: ListTile(
        title: Text("listo"),
        subtitle: Text("Pago en cnt"),
        leading: Image.asset("assets/images/" + img + ".png"),
      ),
    );
  }

  /*@override
  Widget build(BuildContext context) {
    final pagosP = Provider.of<PagosAppProvider>(context);
    return Scaffold(
      body: ListView.builder(
          itemCount: pagosP.pagos.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(pagosP.pagos[index].title),
                subtitle: Text(pagosP.pagos[index].description),
              ),
            );
          }),
    );
  }*/
}
