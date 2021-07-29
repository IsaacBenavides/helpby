import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mydoctor/Widget/Constants.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Información Personal',
            style: TextStyle(color: titleColor, fontFamily: 'Poppins')),
        centerTitle: true,
        leading: IconButton(
            color: titleColor,
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 15,
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          _PersonalinfoSettings(),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      spreadRadius: 5,
                      offset: Offset(0.0, 2.0))
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 50),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: RaisedButton(
                    color: primaryColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Guardar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _width > 353
                            ? 17
                            : _width > 325
                                ? 13
                                : 11,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _PersonalinfoSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _Header(),
          SizedBox(height: 50),
          _Fields(),
          SizedBox(height: 120)
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: 140,
      child: Stack(
        children: [
          Positioned(
            left: (_width / 2) - 40,
            top: 25,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: Offset(10.0, 7.0),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: (_width / 2) + 10,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 12,
              child: Icon(
                Icons.camera_alt,
                color: primaryColor,
                size: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Fields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _Field(
            labelText: 'Nombre',
            keybordType: TextInputType.name,
          ),
          SizedBox(height: 20),
          _DropDownMenu(),
          SizedBox(height: 20),
          _Date(),
          SizedBox(height: 20),
          _Field(
            labelText: 'Numero de Celular',
            keybordType: TextInputType.phone,
          ),
        ],
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final String labelText;
  final TextInputType keybordType;

  const _Field({Key key, this.labelText, this.keybordType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keybordType,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(200, 239, 113, 107),
          ),
        ),
        // fillColor: Color.fromARGB(200, 239, 113, 107)
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        errorStyle: TextStyle(fontSize: 10.0),
        labelText: labelText,

        labelStyle: TextStyle(
            color: Color.fromARGB(200, 150, 150, 150), fontFamily: 'Poppins'),
      ),
    );
  }
}

class _DropDownMenu extends StatefulWidget {
  @override
  __DropDownMenuState createState() => __DropDownMenuState();
}

class __DropDownMenuState extends State<_DropDownMenu> {
  String _opcionSeleccionada;
  List _opciones = ['Masculino', 'Femenino'];

  List<DropdownMenuItem<String>> opciones() {
    List<DropdownMenuItem<String>> lista = new List();
    _opciones.forEach((opcion) {
      lista.add(DropdownMenuItem(
        child: Text(opcion),
        value: opcion,
      ));
    });
    return lista;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0)),
      child: DropdownButtonHideUnderline(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: DropdownButton(
            style: TextStyle(color: subtitleColor, fontFamily: 'Poppins'),
            hint: Text('Sexo'),
            isExpanded: true,
            value: _opcionSeleccionada,
            items: opciones(),
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
          ),
        ),
      ),
    );
  }
}

class _Date extends StatefulWidget {
  @override
  __DateState createState() => __DateState();
}

class __DateState extends State<_Date> {
  String date = '';

  final year = int.parse(DateTime.now().toString().substring(0, 4)) + 1;

  TextEditingController _textToDateInputFieldController =
      new TextEditingController();

  Widget build(BuildContext context) {
    return TextField(
      controller: _textToDateInputFieldController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(200, 239, 113, 107),
          ),
        ),
        // fillColor: Color.fromARGB(200, 239, 113, 107)
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        errorStyle: TextStyle(fontSize: 10.0),
        labelText: 'Fecha de Nacimiento',
        suffixIcon: Icon(Icons.calendar_today),
        labelStyle: TextStyle(
            color: Color.fromARGB(200, 150, 150, 150), fontFamily: 'Poppins'),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectedDate(context: context);
      },
    );
  }

  _selectedDate({BuildContext context}) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1910),
        lastDate: new DateTime(year),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        date = picked.toString().substring(0, 10);
        _textToDateInputFieldController.text = date;
      });
    }
  }
}
