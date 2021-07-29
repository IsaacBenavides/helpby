import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mydoctor/Widget/Constants.dart';
import 'package:mydoctor/pages/AddPaymetMethods.dart';

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Metodos de Pagos',
            style: TextStyle(
                color: titleColor, fontFamily: 'Poppins', fontSize: 20)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: titleColor,
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/Icons/card1.svg',
                  width: 277,
                  height: 160,
                ),
                SizedBox(height: 20),
                Text(
                  'No tienes ningún método de pago. Añadir ahora.',
                  style: TextStyle(
                      color: subtitleColor,
                      fontFamily: 'Poppins',
                      fontSize: 16),
                )
              ],
            ),
          ),
          FooterButton(),
        ],
      ),
    );
  }
}

class FooterButton extends StatelessWidget {
  const FooterButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            boxShadow: [
              BoxShadow(blurRadius: 8, spreadRadius: 3, color: Colors.black12)
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: RaisedButton(
              onPressed: () {
                _openingMethods(context);
              },
              color: primaryColor,
              child: Text(
                'Agregar nuevo',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Poppins', fontSize: 17),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _openingMethods(BuildContext context) async {
    await Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, animation1, __) {
          return FadeTransition(
            opacity: animation1,
            child: Methods(),
          );
        },
      ),
    );
  }
}
