import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          _cardtipo1(),
          SizedBox(
            height: 20,
          ),
          _cardtipo3(),
          SizedBox(
            height: 20,
          ),
          _cardtipo1(),
          SizedBox(
            height: 20,
          ),
          _cardtipo2(),
          SizedBox(
            height: 20,
          ),
          _cardtipo1(),
          SizedBox(
            height: 20,
          ),
          _cardtipo2(),
          SizedBox(
            height: 20,
          ),
          _cardtipo1(),
          SizedBox(
            height: 20,
          ),
          _cardtipo2(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Widget _cardtipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.album),
            title: Text('The Enchanged Nightingale'),
            subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
          ),
          // EL CONTAINER NO ES NECESARIO SOLO LO USÉ PARA VER EL AREA DEL WIDGET QUE ESTOY UTILZANDO
          Container(
            //color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  child: Text('BUY TICKETS'),
                  textColor: Colors.blue,
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text('LISTEN'),
                  textColor: Colors.blue,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardtipo2() {
    return Card(
      elevation: 10.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage(
                  'https://images6.alphacoders.com/465/465671.png'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 250,
              fit: BoxFit.cover),
          /*Image(
            image:
                NetworkImage('https://images6.alphacoders.com/465/465671.png'),
          ),*/
          Container(
              padding: EdgeInsets.all(10),
              child: Text(
                  'Hola Este es Luffy y puedo escribir un texto gigante en este espacio'),
              color: Colors.blue)
        ],
      ),
    );
  }

  //Explicacion container con intencion de card ya que en el video el clipBehavior: Clip.antiAlias No funcionó
  // y adaptan el container a una card
  Widget _cardtipo3() {
    final card = Container(
      //clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: Column(
        children: [
          FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage(
                  'https://images6.alphacoders.com/465/465671.png'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 250,
              fit: BoxFit.cover),
          /*Image(
            image:
                NetworkImage('https://images6.alphacoders.com/465/465671.png'),
          ),*/
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
                'Hola Este es Luffy y este es el container adaptado a una CARD'),
            color: Colors.red,
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          //color: Colors.red,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(2, 10),
            )
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: card,
      ),
    );
  }
}
