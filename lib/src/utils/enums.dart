import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/models/person_model.dart';
import 'package:pagosapp_group/src/pages/perfil_page.dart';
import 'package:pagosapp_group/src/pages/tarjeta_form.dart';
import 'package:pagosapp_group/src/pages/pago_form.dart';
import 'package:pagosapp_group/src/widgets/content/home_widget.dart';



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

List<Widget> contentWidget = [
<<<<<<< Updated upstream
  HomeWidget(),               
=======
  HomeWidget(person: ),
>>>>>>> Stashed changes
  AddTarjeta(),
  PagoPage()
];
