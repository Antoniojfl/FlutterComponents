import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 0.0;
  bool _sliderStatus = true;
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
            _createCheckBox(),
            _createSwichBox(), // Se activan y desactivan ambos porque el estado controla la misma propiedad
            _addImage(),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: "Valor: $_valueSlider", // Sin el division No muestra esto
      value: _valueSlider,
      max: 400.0,
      min: 0.0,
      divisions: 200,
      onChanged: _sliderStatus ? _activateDeactivateSlider : null,
    );
  }

  void _activateDeactivateSlider(double value) {
    setState(() {
      _valueSlider = value;
    });
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

  Widget _createCheckBox() {
    //return Row(
    //  children: [
    //    Text('Activar/Desactivar Slider: '),
    //    Checkbox(
    //      value: _sliderStatus,
    //      onChanged: (value) {
    //        setState(() {
    //          _sliderStatus = value;
    //          print(value);
    //        });
    //      },
    //    )
    //  ],
    //);

    return CheckboxListTile(
      title: (Text('Activar/Desactivar Slider: ')),
      value: _sliderStatus,
      onChanged: (value) {
        setState(() {
          _sliderStatus = value;
          print(value);
        });
      },
    );
  }

  Widget _createSwichBox() {
    return SwitchListTile(
      title: (Text('Activar/Desactivar Slider: ')),
      value: _sliderStatus,
      onChanged: (value) {
        setState(() {
          _sliderStatus = value;
          print(value);
        });
      },
    );
  }
}
