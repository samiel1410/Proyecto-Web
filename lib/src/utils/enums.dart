import 'package:flutter/material.dart';

import 'package:pagosapp_group/src/pages/tarjeta_form.dart';
import 'package:pagosapp_group/src/widgets/content/home_widget.dart';
import 'package:pagosapp_group/src/widgets/content/person_widget.dart';

class ItemMenu {
  String label;
  IconData icon;
  ItemMenu(this.icon, this.label);
}

List<ItemMenu> menuOptions = [
  ItemMenu(Icons.home, "Inicio"),
  ItemMenu(Icons.credit_card, "Tarjeta"),
  ItemMenu(Icons.account_circle_outlined, "Perfil"),
];

List<Widget> contentWidget = [HomeWidget(), AddTarjeta(), PersonWidget()];
