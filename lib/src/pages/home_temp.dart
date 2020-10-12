import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
        centerTitle: true,
      ),
      body: ListView(
        //children: _crearOpciones(),
        children: _crearOpcionesCorta(),
      ),
    );
  }

  List<Widget> _crearOpciones() {
    List<Widget> lista = new List<Widget>();

    for (var item in opciones) {
      final tempWidget = new ListTile(
        title: Text(item),
      );
      lista
        ..add(tempWidget)
        ..add(
          Divider(
            thickness: 5.0,
          ),
        );
    }
    return lista;
  }

  List<Widget> _crearOpcionesCorta() {
    return opciones.map((f) {
      return Column(children: <Widget>[
        ListTile(
          title: Text(f + '!'),
          leading: Icon(Icons.account_balance_wallet),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
        Divider(
          thickness: 5.0,
        )
      ]);
    }).toList();
  }
}
