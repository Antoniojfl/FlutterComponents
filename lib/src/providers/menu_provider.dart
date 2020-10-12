import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    //cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    await Future.delayed(Duration(seconds: 2));
    final resp = await rootBundle.loadString('data/menu_opts.json');
    Map miData = jsonDecode(resp);
    opciones = miData['rutas'];
    return opciones;
  }
}

final menuProvider = new _MenuProvider();
