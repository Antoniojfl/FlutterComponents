import 'package:flutter/material.dart';

class InputFieldPage extends StatefulWidget {
  @override
  _InputFieldPage createState() => _InputFieldPage();
}

class _InputFieldPage extends State<InputFieldPage> {
  String _name = '';
  String _email = '';
  String _fechanacimiento = '';
  List _poderes = ['Volar', 'Rayos X', 'Super Fuerza', 'Super Aliento'];

  String selectedOption = 'Volar';

  TextEditingController _fechaNac = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Input Field'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          children: [
            _createInputs(),
            Divider(),
            _createEmail(),
            Divider(),
            _createPassword(),
            Divider(),
            _fechaNacimiento(),
            ListTile(
              title: Text('Nombre: $_name'),
            ),
            Row(children: [
              Icon(Icons.select_all),
              SizedBox(width: 20),
              Expanded(child: _createDropDownButton())
            ]),
          ],
        ));
  }

  Widget _createInputs() {
    return TextField(
      textCapitalization: TextCapitalization
          .sentences, // Despues de cada espacio coloca la primera letra en Mayuscula
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Letras ${_name.length}'),
        hintText: 'Name',
        labelText: 'Name',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        //counter: Text('Letras ${_name.length}'),
        hintText: 'Email',
        labelText: 'Email',
        //helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      //keyboardType: TextInputType.,
      //textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        //counter: Text('Letras ${_name.length}'),
        hintText: 'Password',
        labelText: 'Password',
        //helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _fechaNacimiento() {
    return TextField(
      controller: _fechaNac,
      //obscureText: true,
      //keyboardType: TextInputType.,
      //textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        //counter: Text('Letras ${_name.length}'),
        hintText: 'Fecha de Nacimiento',
        labelText: 'Fecha de Nacimiento',
        //helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _pickDate(context);
      },
    );
  }

  _pickDate(BuildContext context) async {
    DateTime date = await showDatePicker(
      context: context,
      initialDate: new DateTime(2020, 10, 15, 17),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2022),
      locale: Locale('es', 'VE'),
    );

    if (date != null) {
      setState(() {
        _fechanacimiento = date.toString();
        _fechaNac.text = _fechanacimiento;
      });
    }
  }

  Widget _createDropDownButton() {
    return DropdownButton(
      value: selectedOption,
      items: _dropdownMenuItems(),
      onChanged: (opt) {
        setState(() {
          selectedOption = opt;
        });
      },
    );
  }

  List<DropdownMenuItem<String>> _dropdownMenuItems() {
    List<DropdownMenuItem<String>> menu = new List();

    _poderes.forEach((element) {
      menu.add(
        DropdownMenuItem(
          child: Text(element),
          value: element,
        ),
      );
    });

    return menu;
  }
}
