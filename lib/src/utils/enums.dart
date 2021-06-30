import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/pages/add_tarjeta.dart';
import 'package:pagosapp_group/src/pages/pago_page.dart';
import 'package:pagosapp_group/src/pages/perfil_page.dart';
import 'package:pagosapp_group/src/widgets/content/home_widget.dart';

class ItemMenu {
  String label;
  IconData icon;
  ItemMenu(this.icon, this.label);
}

<<<<<<< HEAD
List<ItemMenu> menuOptions = [
  ItemMenu(Icons.home, "Inicio"),
  ItemMenu(Icons.credit_card, "Tarjeta"),
  ItemMenu(Icons.account_circle_outlined, "Perfil"),
];

List<Widget> contentWidget = [HomeWidget(), AddTarjeta(), PerfilPage()];
=======
 List<Widget>contentWidget=[
   HomeWidget(),AddTarjeta(),PagoPage()
 ];
>>>>>>> 13a502274ee29ec75b46270236ec8ec992529bb5
