import 'package:flutter/material.dart';

class ListBuilderPage extends StatefulWidget {
  _ListBuilderState createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Builder'),
      ),
      body: _listBuilder(),
    );
  }

  _listBuilder() {
    List<int> _items = [115, 52, 43, 994, 5];

    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int index) {
        int _itemIndex = _items[index];
        return FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://picsum.photos/id/$_itemIndex/400/300'),
        );
      },
    );
  }
}
