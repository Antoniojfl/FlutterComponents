import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 5),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://hipertextual.com/files/2019/04/hipertextual-avengers-endgame-contiene-ultimo-cameo-stan-lee-2019632812-scaled.jpg'),
              radius: 25,
              //child: Text('SL', style: TextStyle(fontSize: 20)),
              //backgroundColor: Colors.black38,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 5),
            child: CircleAvatar(
              radius: 25,
              child: Text('SL', style: TextStyle(fontSize: 20)),
              backgroundColor: Colors.black38,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://hipertextual.com/files/2019/04/hipertextual-avengers-endgame-contiene-ultimo-cameo-stan-lee-2019632812-scaled.jpg'),
          placeholder: AssetImage('assets/loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
