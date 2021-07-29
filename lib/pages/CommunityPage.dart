import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mydoctor/Widget/CategoriesToSelect.dart';
import 'package:mydoctor/Widget/Constants.dart';
import 'package:mydoctor/Widget/Search.dart';
import 'package:mydoctor/pages/CategoriesForCommunityPage.dart';
import 'package:mydoctor/pages/QuestionPage.dart';
import 'package:mydoctor/pages/my_flutter_app_icons.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Components(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => QuestionPage(),
          ),
        ),
        backgroundColor: primaryColor,
        child: Transform.rotate(angle: -pi / 2, child: Icon(Icons.bar_chart)),
      ),
    );
  }
}

class Components extends StatefulWidget {
  @override
  _ComponentsState createState() => _ComponentsState();
}

class _ComponentsState extends State<Components> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
            child: Row(
              children: [
                Text(
                  'Comunidad',
                  style: TextStyle(
                      color: titleColor, fontFamily: 'Poppins', fontSize: 30),
                ),
                Spacer(),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              CategoriesForCommunity()));
                    },
                    child: SvgPicture.asset('assets/Icons/Categories.svg'))
              ],
            ),
          ),
          Search(
            descriptions: 'Buscar publicación',
          ),
          CategoriesToSelect(
            onTapChanged: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            categories: [
              'General',
              'Endocrino',
              'Dentista',
              'Ortopedista',
              'Cirujano',
            ],
          ),
          IndexedStack(
            index: _currentIndex,
            children: [
              _Generalpage(),
              Container(
                child: Center(
                  child: Text('Endocrino Page'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Dentista Page'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Ortopedista Page'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Cirujano Page'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _Generalpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        6,
        (index) => QAndAContainer(),
      ),
    );
  }
}

class QAndAContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
              border: Border.all(
                color: secondColor.withOpacity(0.5),
                width: 1.0,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Estimado doctor, yo soy Dimitri, cuando quiero apurar B, solo digo uno, dos, tres. ¿No tome el awp sino solo un p90?',
                    style: TextStyle(
                        fontSize: 14, fontFamily: 'Poppins', color: titleColor),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      children: [
                        Text(
                          'Hombre, 29 años',
                          style: TextStyle(color: secondColor),
                        ),
                        Spacer(),
                        Text('Hace 3 días',
                            style: TextStyle(color: secondColor))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _Doctor(),
          SizedBox(
            height: 10,
          ),
          _Pacient(),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}

class _Doctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38.withOpacity(0.08),
                          blurRadius: 5,
                          spreadRadius: 0.5,
                          offset: Offset(3, 2))
                    ],
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      ' Dr. Dimitri Petronko',
                      style: TextStyle(
                          color: subtitleColor,
                          fontSize: 15,
                          height: 1,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          color: Colors.orange[300],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _Pacient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _widht = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          child: Text(
            'Estimado paciente Dimitri, mi nombre es Petrenko, juego KLow, con un buen moloko, planto la papa, en este yacky cojo, todos son mi amigo,…',
            style: TextStyle(color: subtitleColor),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: _widht - _widht * 0.83,
            ),
            Expanded(
              child: Row(
                children: [
                  Text(
                    'Compartir',
                    style: TextStyle(color: subtitleColor),
                  ),
                  Icon(
                    Icons.share,
                    size: 15,
                    color: subtitleColor,
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Me gusta',
                    style: TextStyle(color: subtitleColor),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    MyFlutterApp.thumbs_up,
                    color: subtitleColor,
                    size: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
