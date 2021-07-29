import 'package:flutter/material.dart';
import 'package:mydoctor/Widget/CustomDropDownMenu.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final query = MediaQuery.of(context);
    return MediaQuery(
      data: query.copyWith(
          textScaleFactor: query.textScaleFactor.clamp(0.8, 1.2)),
      child: Row(
        children: [
          Row(
            children: [
              Text(
                'Help',
                style: TextStyle(
                    color: Color(0xFF0C0B52),
                    fontSize: _width > 320 ? 30 : 20,
                    fontFamily: 'Poppins'),
              ),
              Text(
                'by',
                style: TextStyle(
                    color: Color.fromARGB(255, 239, 113, 107),
                    fontSize: _width > 320 ? 30 : 20,
                    fontFamily: 'Poppins'),
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Icon(
                Icons.person_pin_circle,
                color: Color(0xFF5A5987),
                size: 30,
              ),
              SizedBox(width: 5),
              CustomDropDownMenu(
                opcionSeleccionada: 'Colombia',
                opciones: ['Londres', 'Alemania', 'Colombia'],
              )
            ],
          ),
        ],
      ),
    );
  }
}
