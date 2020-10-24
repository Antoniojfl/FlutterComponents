import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//test
//import 'package:componentes/src/pages/home_temp.dart';
import 'src/pages/home_page.dart';

//Rutas
import 'package:componentes/src/routes/routes.dart';
import 'package:componentes/src/pages/alert_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('es', ''),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Componentes App',
      //home: HomePage(),

      //Nota: el home y el initial route tienen conflictos por ambiguedad, o se usa uno
      //o se usa el otro. Leer

      initialRoute: '/',
      routes: getApplicationRoutes(),

      //onGenerateRoute se llama si no encuentra nada en el routes y sirve para
      //llamar rutas que no esten definidas ejemplo, en mi menu_opts.json
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) => AlertPage());
      },
    );
  }
}
