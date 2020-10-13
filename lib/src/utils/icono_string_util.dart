import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  "add_alert": Icons.add_alert,
  "accessibility": Icons.accessibility,
  "folder_open": Icons.folder_open,
  "donut_large": Icons.donut_large
};

Icon iconFromString({icono: String}) {
  return Icon(_icons[icono], color: Colors.blue);
}
