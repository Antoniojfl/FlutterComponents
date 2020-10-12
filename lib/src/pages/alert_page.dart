import 'dart:ui';

import 'package:flutter/Material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
        centerTitle: true,
        automaticallyImplyLeading:
            false, // elimina automaticamente la flecha para volver atras
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          //shape: OutlineInputBorder(
          //borderRadius: BorderRadius.all(Radius.circular(20.0))),
          //shape: UnderlineInputBorder(
          //borderRadius: BorderRadius.only(topLeft: Radius.circular(20))),
          //shape: UnderlineInputBorder(),
          shape: StadiumBorder(),
          textColor: Colors.white,
          onPressed: () => _showAlert(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        //Encerré el AlertDialog en un BackdropFilter para hacer un efecto blue
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text('Titulo'),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              Text('Este es el contenido de la caja de la alerta'),
              SizedBox(
                height: 20,
              ),
              FlutterLogo(
                size: 100,
              )
            ]),
            actions: [
              FlatButton(
                child: Text('CANCELAR'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                textColor: Colors.blue,
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
