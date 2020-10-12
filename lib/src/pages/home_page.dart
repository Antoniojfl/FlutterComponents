import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:componentes/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes APP'),
        centerTitle: true,
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    //print(menuProvider.opciones);
    /*menuProvider.cargarData().then((opciones) {
      print('_lista');
      print(opciones);
    });*/ // de esta forma se espera a que se resuelva el futuro y se le asignen datos a opciones

    /*return ListView(
      children: _listaItems(),
    );*/

    // FutureBuilder

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [
        {'texto': 'Loading...'}
      ],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        print(snapshot.data);

        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    for (Map<dynamic, dynamic> element in data) {
      Widget tempWidget = ListTile(
        title: Text(element["texto"]),
        leading: iconFromString(icono: element["icon"]),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          //Forma tradicional o normal de navear a otra pagina

          //final route = MaterialPageRoute( builder: (context) => AlertPage());
          //Navigator.push(context, route);

          //Forma recomendada por el profe para navegar a otra pagina

          Navigator.pushNamed(context, element["ruta"]);
        },
      );
      opciones..add(tempWidget)..add(Divider());
    }
    return opciones;
  }
}
