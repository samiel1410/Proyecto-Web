import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pagosapp_group/src/pages/analisis_page.dart';
import 'package:pagosapp_group/src/pages/goal_page.dart';
import 'dart:convert';
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
GeoReference geoReferenceFromJson(String str) =>
    GeoReference.fromJson(json.decode(str));

String geoReferenceToJson(GeoReference data) => json.encode(data.toJson());

class GeoReference {
  GeoReference({
    required this.lat,
    required this.lng,
  });

  double lat;
  double lng;

  factory GeoReference.fromJson(Map<String, dynamic> json) => GeoReference(
        lat: json["_latitude"],
        lng: json["_longitude"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };

  LatLng getGeo() {
    return LatLng(lat, lng);
  }
}