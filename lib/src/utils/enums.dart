import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/pages/analisis_page.dart';
import 'package:pagosapp_group/src/pages/goal_page.dart';

import 'package:pagosapp_group/src/widgets/content/home_widget.dart';

class ItemMenu {
  String label;
  IconData icon;
  ItemMenu(this.icon, this.label);
}

List<ItemMenu> menuOptions = [
  ItemMenu(Icons.home, "Inicio"),
  ItemMenu(Icons.pie_chart_outline, "Analisis"),
  ItemMenu(Icons.emoji_events_outlined, "Metas"),
];

List<ItemMenu> settingsOptions = [
  ItemMenu(Icons.settings, "Configuración"),
  ItemMenu(Icons.supervised_user_circle, "Créditos")
];

List<Widget> contentWidget = [HomeWidget(), AnalisisPage(), GoalElementPage()];
