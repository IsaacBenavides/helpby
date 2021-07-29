import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:mydoctor/Widget/Categories.dart';

import 'package:mydoctor/Widget/Constants.dart';

import 'package:mydoctor/Widget/CustomDropDownMenu.dart';
import 'package:mydoctor/Widget/PriceAndButton.dart';
import 'package:mydoctor/pages/DetailPage.dart';

class ServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Container(),
            Spacer(),
            CustomDropDownMenu(
              opcionSeleccionada: 'Colombia',
              opciones: ['Londres', 'Alemania', 'Colombia'],
            )
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: titleColor,
          ),
        ),
      ),
      body: _ContainAll(),
    );
  }
}

class _ContainAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 3,
                color: Colors.black12.withOpacity(0.09),
                offset: Offset(0.0, -3.0))
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _Title(),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return _ContainDescription();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 10),
      child: Text(
        'Servicio',
        style: TextStyle(
            color: titleColor, fontSize: 20, fontWeight: FontWeight.w400),
      ),
    );
  }
}

class _ContainDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _widht = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          _line(widht: _widht),
          _Description(),
          _line(widht: _widht),
          PriceAndButton()
        ],
      ),
    );
  }

  _line({double widht}) {
    return Container(
      color: Colors.grey.withOpacity(0.5),
      height: 1,
      width: widht - 40,
    );
  }
}

class _Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _widht = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => DetailPage()));
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        height: ScreenUtil().setHeight(180),
        width: _widht - 40,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey),
                ),
                SizedBox(
                  width: 10,
                ),
                _AllText(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Categories()
          ],
        ),
      ),
    );
  }
}

class _AllText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Examen de salud básico",
            style: TextStyle(color: titleColor, fontSize: 17),
          ),
          Container(
            height: 35,
            width: 227,
            child: Text(
              textExample,
              maxLines: 2,
              style: TextStyle(
                color: subtitleColor,
                fontSize: 14,
              ),
            ),
          ),
          Container(
            height: 18,
            width: 70,
            decoration: BoxDecoration(
                color: Colors.lightBlue.withOpacity(0.1),
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(5), right: Radius.circular(5))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Detalle',
                  style: TextStyle(color: Colors.lightBlue),
                ),
                SizedBox(
                  width: 2,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 10,
                  color: Colors.lightBlue,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
