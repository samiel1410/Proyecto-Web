import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/pages/analisis_page.dart';

import 'package:pagosapp_group/src/pages/perfil_page.dart';
import 'package:pagosapp_group/src/widgets/content/home_widget.dart';



class ItemMenu {
  String label;
  IconData icon;
  ItemMenu(this.icon, this.label);
}

List<ItemMenu> menuOptions = [
  ItemMenu(Icons.home, "Inicio"),
  ItemMenu(Icons.pie_chart_outline, "Analisis"),
  ItemMenu(Icons.account_circle_outlined, "Perfil"),
];

List<Widget> contentWidget = [HomeWidget(), AnalisisPage() , PerfilPage()];
