import 'package:flutter/material.dart';
import 'package:mydoctor/pages/SelectHospitalPage.dart';

import 'Constants.dart';

class PriceAndButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    return Container(
      width: _width - 40,
      height: 50,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Precio:',
                style: TextStyle(color: secondColor),
              ),
              Text(
                '\$1200',
                style: TextStyle(color: primaryColor, fontSize: 20),
              ),
            ],
          ),
          Spacer(),
          RaisedButton(
            color: primaryColor,
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SelectedHospitalPage(),
            )),
            child: Container(
              width: 120,
              child: Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Text(
                  'Reservar ahora',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
