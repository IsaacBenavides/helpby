import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

class CustomDropDownMenu extends StatefulWidget {
  String opcionSeleccionada;
  List<String> opciones = new List();
  CustomDropDownMenu({Key key, this.opcionSeleccionada, this.opciones})
      : super(key: key);

  @override
  _CustomDropDownMenuState createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  List<DropdownMenuItem<String>> opciones() {
    List<DropdownMenuItem<String>> lista = new List();
    widget.opciones.forEach((opcion) {
      lista.add(DropdownMenuItem(
        child: Text(opcion),
        value: opcion,
      ));
    });
    return lista;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: widget.opcionSeleccionada,
        style: TextStyle(
          color: Color(0xFF5A5987),
          fontSize: 15 * ScreenUtil().textScaleFactor,
          fontFamily: 'Poppins',
        ),
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Color(0xFF5A5987),
        ),
        items: opciones(),
        onChanged: (opt) {
          setState(
            () {
              widget.opcionSeleccionada = opt;
            },
          );
        },
      ),
    );
  }
}
