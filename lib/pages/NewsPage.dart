import 'package:flutter/material.dart';

import 'package:mydoctor/Widget/CategoriesToSelect.dart';
import 'package:mydoctor/Widget/Constants.dart';
import 'package:mydoctor/Widget/Search.dart';
import 'package:mydoctor/Widget/Trending.dart';
import 'package:mydoctor/pages/NewsDetailPage.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: titleColor,
          ),
        ),
        title: Text(
          'Noticias',
          style: TextStyle(
            color: titleColor,
            fontSize: 20,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Search(descriptions: 'Buscar por noticias'),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: CategoriesToSelect(
              categories: [
                'General',
                'Salud',
                'Noticias',
                'Cáncer',
                'Médico',
                'Vivir saludablemente'
              ],
              onTapChanged: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
            ),
          ),
          IndexedStack(
            index: _currentIndex,
            children: [
              _GeneralPage(),
              Container(
                child: Text('Health Page'),
              ),
              Container(
                child: Text('News Page'),
              ),
              Container(
                child: Text('Cancer Page'),
              ),
              Container(
                child: Text('Medical Page'),
              ),
              Container(
                child: Text('Live Healthy Page'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GeneralPage extends StatelessWidget {
  const _GeneralPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NewsDetailPage(),
            ));
          },
          child: Container(
            padding: EdgeInsets.only(top: 20),
            margin: EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            height: _height > 600 ? 200 : 230,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [Colors.black26, Colors.black87])),
            child: Stack(
              children: [
                Positioned(
                  left: 10,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.only(
                      top: 85,
                    ),
                    width: _width - 80,
                    color: Colors.transparent,
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Síntomas de COVID-19: ¿cuáles son y debo ver a un médico?",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 15),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Dimitri - 9 de marzo. 2020',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, top: 20),
          child: Text(
            'Tendencias',
            style: TextStyle(
                color: titleColor, fontFamily: 'Poppins', fontSize: 20),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 30, top: 30),
            child: Trending(
              width: _width - _width * 0.4,
            ))
      ],
    );
  }
}
