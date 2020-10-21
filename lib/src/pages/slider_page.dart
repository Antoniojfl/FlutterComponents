import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            _createSlider(),
            _addImage(),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la Imagen',
      value: _valueSlider,
      max: 400.0,
      min: 0.0,
      divisions: 200,
      onChanged: (double value) {
        //print(value);
        setState(() {
          _valueSlider = value;
        });
      },
    );
  }

  Widget _addImage() {
    return Expanded(
      child: Image(
        image: NetworkImage(
            "https://assets.stickpng.com/images/5ede4a3fb760540004f2c5e9.png"),
        width: _valueSlider,
      ),
    );
  }
}
