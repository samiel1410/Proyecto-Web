import 'package:flutter/material.dart';
import 'package:pagosapp_group/services/card_service.dart';
import 'package:pagosapp_group/src/models/tarjeta_model.dart';
import 'package:pagosapp_group/src/widgets/cards/cards_card.dart';

class CardList extends StatefulWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  CardService _service = CardService();
  List<Tarjeta> _cards = [];

  @override
  void initState() {
    super.initState();
    // _loadPayments();
  }

  @override
  Widget build(BuildContext context) {
    return _cards.length == 0
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Column(children: _cards.map((e) => TarjetaCard(tar: e)).toList());
  }

  /*_loadPayments() {
    _service.getPayament().then((value) {
      _cards= value;
      setState(() {});
    });
  }*/
}
