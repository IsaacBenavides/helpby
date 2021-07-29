import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_svg/svg.dart';

import 'Constants.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    if (_width < 370) {
      return TwoColumnsTwoTwo();
    } else if (_width >= 370 && _width < 450) {
      return TwoColumnsTwoTwo();
    } else if (_width >= 450) {
      return OneRow();
    }
  }
}

class TwoColumnsTwoTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _SCategory(
              h: ScreenUtil().setHeight(30),
              icon: 'assets/Icons/gender.svg',
              text: 'Cualquier género',
              w: ScreenUtil().setWidth(165),
              color1: backgroundColorIcons1,
              color2: colorIcons1,
            ),
            SizedBox(
              width: ScreenUtil().setWidth(15),
            ),
            _SCategory(
              w: ScreenUtil().setWidth(150),
              h: ScreenUtil().setHeight(30),
              icon: 'assets/Icons/cake.svg',
              text: 'Cualquier edad',
              color1: backgroundColorIcons2,
              color2: colorIcons2,
            ),
          ],
        ),
        SizedBox(height: ScreenUtil().setHeight(10)),
        Row(
          children: [
            _SCategory(
              w: ScreenUtil().setWidth(110),
              h: ScreenUtil().setHeight(30),
              icon: 'assets/Icons/flask.svg',
              text: '13 Tests',
              color1: backgroundColorIcons3,
              color2: colorIcons3,
            ),
            SizedBox(
              width: ScreenUtil().setWidth(15),
            ),
            _SCategory(
              w: ScreenUtil().setWidth(210),
              h: ScreenUtil().setHeight(30),
              icon: 'assets/Icons/prescription.svg',
              text: 'Chequeo de 4 categorías',
              color1: backgroundColorIcons4,
              color2: colorIcons4,
            ),
          ],
        )
      ],
    );
  }
}

class OneRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _SCategory(
          h: ScreenUtil().setHeight(30),
          icon: 'assets/Icons/gender.svg',
          text: 'Cualquier género',
          w: ScreenUtil().setWidth(80),
          color1: backgroundColorIcons1,
          color2: colorIcons1,
        ),
        SizedBox(
          width: ScreenUtil().setWidth(15),
        ),
        _SCategory(
          w: ScreenUtil().setWidth(80),
          h: ScreenUtil().setHeight(30),
          icon: 'assets/Icons/cake.svg',
          text: 'Cualquier edad',
          color1: backgroundColorIcons2,
          color2: colorIcons2,
        ),
        SizedBox(
          width: ScreenUtil().setWidth(15),
        ),
        _SCategory(
          w: ScreenUtil().setWidth(60),
          h: ScreenUtil().setHeight(30),
          icon: 'assets/Icons/flask.svg',
          text: '13 Tests',
          color1: backgroundColorIcons3,
          color2: colorIcons3,
        ),
        SizedBox(
          width: ScreenUtil().setWidth(15),
        ),
        _SCategory(
          w: ScreenUtil().setWidth(110),
          h: ScreenUtil().setHeight(30),
          icon: 'assets/Icons/prescription.svg',
          text: 'Chequeo de 4 categorías',
          color1: backgroundColorIcons4,
          color2: colorIcons4,
        ),
      ],
    );
  }
}

class _SCategory extends StatelessWidget {
  final double w;
  final double h;
  final String icon;
  final String text;
  final Color color1;
  final Color color2;

  const _SCategory(
      {Key key,
      @required this.w,
      @required this.h,
      @required this.icon,
      @required this.text,
      @required this.color1,
      @required this.color2})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
          color: color1, borderRadius: BorderRadius.circular(5.0)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 10),
            child: SvgPicture.asset(icon),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              text,
              style: TextStyle(
                  color: color2, fontSize: 12 * ScreenUtil().scaleText),
            ),
          )
        ],
      ),
    );
  }
}
