import 'package:flutter/material.dart';
import 'package:mydoctor/Widget/Constants.dart';

class SchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Calendario',
          style:
              TextStyle(color: titleColor, fontFamily: 'Poppins', fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45.0, bottom: 25),
                child: Text('Espere el pago - 1',
                    style: TextStyle(
                        color: titleColor,
                        fontFamily: 'Poppins',
                        fontSize: 25)),
              ),
              _ContainInformation(
                finalContainerWidth: 71,
                finalContainercolor: primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0, bottom: 25),
                child: Text('En marcha',
                    style: TextStyle(
                        color: titleColor,
                        fontFamily: 'Poppins',
                        fontSize: 25)),
              ),
              _ContainInformation(
                finalContainerWidth: 71,
                finalContainercolor: primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0, bottom: 25),
                child: Text('Historia',
                    style: TextStyle(
                        color: titleColor,
                        fontFamily: 'Poppins',
                        fontSize: 25)),
              ),
              _ContainInformation(
                finalContainerWidth: 71,
                finalContainercolor: primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContainInformation extends StatelessWidget {
  final Color finalContainercolor;
  final double finalContainerWidth;

  const _ContainInformation(
      {Key key, this.finalContainercolor, this.finalContainerWidth})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Container(
      height: 150,
      width: _width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                spreadRadius: 2,
                color: Colors.black26.withOpacity(0.1))
          ]),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            height: 96,
            width: 96,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(
            width: 10,
          ),
          _Information(
            finalContainerWidth: finalContainerWidth,
            finalContainercolor: finalContainercolor,
          )
        ],
      ),
    );
  }
}

class _Information extends StatelessWidget {
  final Color finalContainercolor;
  final double finalContainerWidth;

  const _Information(
      {Key key, this.finalContainercolor, this.finalContainerWidth})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 44,
          width: _width > 320 ? _width - _width * 0.5 : 120,
          color: titleColor,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 20,
          width: 110,
          color: Colors.grey,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 18,
          width: finalContainerWidth,
          color: finalContainercolor,
        )
      ],
    );
  }
}
