import 'dart:async';
import 'package:flutter/material.dart';

class ListBuilderPage extends StatefulWidget {
  _ListBuilderState createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilderPage> {
  List<int> _items = new List();
  int _initItem = 0;
  bool _loading = false;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _agregar10();
    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          //agregar10();
          _fetchImages();
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List Builder'),
        ),
        body: Stack(
          children: [
            _listBuilder(),
            _loadingProgressIndicator(),
          ],
        ));
  }

  _listBuilder() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int index) {
        int _itemIndex = _items[index];
        return FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image:
              NetworkImage('https://picsum.photos/500/300/?image=$_itemIndex'),
        );
      },
    );
  }

  void _agregar10() {
    for (int i = 0; i < 10; i++) {
      _initItem++;
      _items.add(_initItem);
    }
    setState(() {});
  }

  Future _fetchImages() async {
    _loading = true;

    setState(() {});
    final duration = new Duration(seconds: 2);
    return new Timer(duration, _httpMethod);
  }

  void _httpMethod() {
    _loading = false;

    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));

    _agregar10();
  }

  Widget _loadingProgressIndicator() {
    if (_loading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 25.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
