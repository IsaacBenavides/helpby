import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mydoctor/tab/model/chooseCities.dart';

class Cities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Material(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 400),
              tween: Tween(begin: 1.0, end: 0.0),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0.0, value * height * 0.8),
                  child: child,
                );
              },
              child: _ContainAll(
                height: height,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContainAll extends StatelessWidget {
  final height;

  _ContainAll({Key key, @required this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.8,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
          color: Colors.white),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _Header(),
            _ContainerToMyList(
              height: height,
            ),
            _Button(),
            Container(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/Flags/Location.svg'),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Localiza tu ciudad',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 12, 11, 82),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Elija su ciudad para que podamos ofrecer\n      el servicio que más te conviene',
              style: TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 90, 89, 135)),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContainerToMyList extends StatelessWidget {
  final height;
  final _index = ValueNotifier<int>(0);

  _ContainerToMyList({Key key, @required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 20),
      child: Column(
        children: List.generate(
          cities.length,
          (index) {
            return ValueListenableBuilder(
              valueListenable: _index,
              builder: (_, value, child) {
                final textColor = (value != null && value == index)
                    ? Color.fromARGB(255, 12, 11, 82)
                    : Color.fromARGB(255, 90, 89, 135).withOpacity(0.6);
                return GestureDetector(
                  onTap: () => _index.value = index,
                  child: _MyList(
                    index: index,
                    textColor: textColor,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _MyList extends StatelessWidget {
  final int index;
  final Color textColor;

  const _MyList({Key key, @required this.index, @required this.textColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 372,
      height: 40,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text(
              cities[index].city,
              style: TextStyle(fontSize: 18, color: textColor),
            ),
          ),
          Container(
            height: 1,
            width: 372,
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7.0),
      child: RaisedButton(
        color: Color.fromARGB(255, 239, 113, 107),
        onPressed: () {},
        child: Container(
          width: 307,
          height: 48,
          child: Center(
            child: Text(
              'Seleccione',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
