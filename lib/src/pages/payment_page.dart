import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/models/expense_model.dart';
import 'package:pagosapp_group/src/utils/standard_widgets.dart';
import 'package:pagosapp_group/src/widgets/content/payment_detail_widget.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key, required this.payment})
      : super(key: key);
  final Expense payment;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Standard.appBar(context, payment.categori),
        body: CustomScrollView(
          slivers: [
            _appBar(context),
            SliverFillRemaining(
                child: PaymentDetailsWidget(payment: payment))
          ],
        ));
  }

  _appBar(BuildContext context) {
    return Container(
      child: SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).canvasColor,
          expandedHeight: 210.0,
          flexibleSpace: FlexibleSpaceBar(
              background: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Standard.getBackground(context),
              Container(
                child: Column(children: [
                  SizedBox(height: 35.0),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Theme.of(context).canvasColor),
                    /*child: ClipOval(
                      child: Image.asset("assets/images/" +
                          Standard.getFisioImage(Payment.type) +
                          ".png"),
                    ),*/
                  ),
                  Standard.titleToForm(context, payment.categori)
                ]),
              ),
            ],
          ))),
    );
  }
}
