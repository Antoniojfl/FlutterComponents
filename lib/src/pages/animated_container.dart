import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPage createState() => _AnimatedContainerPage();
}

class _AnimatedContainerPage extends State<AnimatedContainerPage> {
  double _height = 50;
  double _width = 50;
  BorderRadiusGeometry _radio = BorderRadius.circular(8);
  Color _color = Colors.pink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _radio,
            color: _color,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.aspect_ratio),
        onPressed: () {
          setState(() {
            _width = Random.secure().nextInt(300).toDouble();
            _height = Random.secure().nextInt(300).toDouble();
            _color = Color.fromRGBO(
                Random.secure().nextInt(255),
                Random.secure().nextInt(255),
                Random.secure().nextInt(255),
                1.0);
          });
        },
      ),
    );
  }
}
