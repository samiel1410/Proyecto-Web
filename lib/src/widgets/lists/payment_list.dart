
import 'package:flutter/material.dart';
import 'package:pagosapp_group/api/api.dart';
import 'package:pagosapp_group/src/models/payment_model.dart';

class PaymentList extends StatefulWidget {
  @override
  _PaymentListState createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  bool isLoading = false; //Variable para verificar si esta cargando los datos
  List<Payment> paymentList = [];
  PagosAppProvider pagosAppProvider = new PagosAppProvider();

  @override
  void initState() {
    _fetchPayments();
    super.initState();
  }

  Future _fetchPayments() async {
    setState(() => isLoading = true);
    paymentList = await pagosAppProvider.fetchPosts();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      isLoading
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: paymentList.length,
              itemBuilder: (BuildContext context, int index) {
                //return buildResultCard(paymentList[index]);
                return ListTile(
                    title: Text(
                      paymentList[index].title,
                      style: TextStyle(fontSize: 20),
                    ),
                    //subtitle: Text(paymentList[index].amount));
                    subtitle: Text(paymentList[index].address));
              },
            ),
    ]);
  }
}

