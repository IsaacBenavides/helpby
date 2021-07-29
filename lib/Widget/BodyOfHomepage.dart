import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mydoctor/Widget/Constants.dart';
import 'package:mydoctor/Widget/SizeConfig.dart';
import 'package:mydoctor/Widget/customAppBar.dart';
import 'package:mydoctor/pages/Cities.dart';
import 'package:mydoctor/pages/NewsPage.dart';
import 'package:mydoctor/pages/ServicePage.dart';
import 'package:mydoctor/tab/model/looking.dart';

class BodyOfHomepage extends StatefulWidget {
  @override
  _BodyOfHomepageState createState() => _BodyOfHomepageState();
}

class _BodyOfHomepageState extends State<BodyOfHomepage> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    return MediaQuery(
      data: query.copyWith(
          textScaleFactor: query.textScaleFactor.clamp(0.8, 1.2)),
      child: SafeArea(
        child: ListView(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: CustomAppBar()),
            Container(
              padding: EdgeInsets.only(left: 15, top: 15, bottom: 10),
              child: Text(
                '¿Qué estás buscando?',
                style: TextStyle(
                    color: Color(0xFF0C0B52),
                    fontSize: 20 * ScreenUtil().scaleText,
                    fontFamily: 'Poppins'),
              ),
            ),
            ContainOfWhatAreYoulookingFor(),
            ContainOfDisease(),
            ContaiOfCheckUpPackage(),
            NewsContainers(),
          ],
        ),
      ),
    );
  }
}

class ContainOfWhatAreYoulookingFor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(170),
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => items[index].routes));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 15),
                  width: ScreenUtil().setWidth(120),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          height: ScreenUtil().setHeight(145),
                          width: ScreenUtil().setWidth(95),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 10,
                                spreadRadius: 1,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: ScreenUtil().setHeight(70),
                                left: 10,
                                right: 5),
                            child: Text(items[index].title,
                                style: TextStyle(
                                    fontSize: 15 * ScreenUtil().scaleText,
                                    color: Color(0xFF5A5987),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: ScreenUtil().setHeight(80),
                          width: ScreenUtil().setHeight(80),
                          decoration: BoxDecoration(
                              color: items[index].color,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: SvgPicture.asset(
                              items[index].icon,
                              height: ScreenUtil().setHeight(65),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ContainOfDisease extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: ScreenUtil().setHeight(320),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Container(
              margin: EdgeInsets.only(left: 15, top: 10),
              child: Text(
                "Enfermedad: COVID-19",
                style: TextStyle(
                    fontSize: 20 * ScreenUtil().scaleText,
                    color: Color(0xFF0C0B52),
                    fontFamily: 'Poppins'),
              ),
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(268),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                    onTap: () {
                      _openingCities(context);
                    },
                    child: Disease(
                      image: 'assets/Flags/Clipped.svg',
                      title: 'UK',
                    )),
                Disease(
                  image: 'assets/Flags/world.svg',
                  title: 'Mundo',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openingCities(BuildContext context) async {
    await Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, animation1, __) {
          return FadeTransition(
            opacity: animation1,
            child: Cities(),
          );
        },
      ),
    );
  }
}

class Disease extends StatefulWidget {
  String image;
  String title;
  Disease({Key key, this.image, this.title}) : super(key: key);
  @override
  _DiseaseState createState() => _DiseaseState();
}

class _DiseaseState extends State<Disease> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: ScreenUtil().setWidth(180),
        height: ScreenUtil().setHeight(210),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 13,
                horizontal: 15,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    widget.image,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 18 * ScreenUtil().scaleText,
                        fontFamily: 'Poppins'),
                  ),
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.5),
                    child: Container(
                      height: ScreenUtil().setHeight(15),
                      width: ScreenUtil().setHeight(15),
                      color:
                          Color.fromARGB(255, 151, 151, 151).withOpacity(0.2),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: ScreenUtil().setHeight(15),
                        color: Color.fromARGB(255, 73, 125, 279),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Container(
                height: ScreenUtil().setHeight(32),
                width: ScreenUtil().setWidth(145),
                color: Color.fromARGB(255, 249, 237, 235),
                child: Container(
                  margin: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 5,
                      right: ScreenUtil().setWidth(35)),
                  color: Color.fromARGB(255, 239, 113, 107),
                ),
              ),
            ),
            SizedBox(height: ScreenUtil().setWidth(15)),
            Center(
              child: Container(
                  height: ScreenUtil().setHeight(32),
                  width: ScreenUtil().setWidth(145),
                  color: Color.fromARGB(255, 235, 249, 235),
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                        left: 5,
                        right: ScreenUtil().setWidth(60)),
                    color: Color.fromARGB(255, 82, 209, 107),
                  )),
            ),
            SizedBox(height: ScreenUtil().setWidth(15)),
            Center(
              child: Container(
                  height: ScreenUtil().setHeight(32),
                  width: ScreenUtil().setWidth(145),
                  color: Color.fromARGB(255, 235, 249, 235),
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                        left: 5,
                        right: ScreenUtil().setWidth(80)),
                    color: Color.fromARGB(255, 151, 151, 151),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class ContaiOfCheckUpPackage extends StatelessWidget {
  final List<dynamic> checkupPackage = ["Estandar", "Visión general"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(200),
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              children: [
                Text(
                  "Paquete de chequeo",
                  style: TextStyle(
                      fontSize: 20 * ScreenUtil().scaleText,
                      color: Color(0xFF0C0B52),
                      fontFamily: 'Poppins'),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ServicePage(),
                  )),
                  child: Container(
                    margin: EdgeInsets.only(right: 10, top: 3),
                    height: 20,
                    width: 63,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 233, 239, 254),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6.0, right: 4),
                        child: Row(
                          children: [
                            Text('más',
                                style: TextStyle(
                                    fontSize: 15 * ScreenUtil().scaleText)),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(165),
            child: ListView.builder(
              itemCount: checkupPackage.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Container(
                    height: ScreenUtil().setHeight(100),
                    width: ScreenUtil().setWidth(200),
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 2,
                            color: Colors.black.withOpacity(0.2))
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: ScreenUtil().setWidth(10),
                                right: ScreenUtil().setWidth(10)),
                            height: ScreenUtil().setHeight(80),
                            width: ScreenUtil().setWidth(80),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              checkupPackage[index],
                              style: TextStyle(
                                  color: subtitleColor,
                                  fontSize: 16 * ScreenUtil().scaleText,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class NewsContainers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenUtil().setHeight(300),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              children: [
                Text(
                  "Noticias",
                  style: TextStyle(
                      fontSize: 20 * ScreenUtil().scaleText,
                      color: Color(0xFF0C0B52),
                      fontFamily: 'Poppins'),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NewsPage(),
                  )),
                  child: Container(
                    margin: EdgeInsets.only(right: 10, top: 3),
                    height: 20,
                    width: 63,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 233, 239, 254),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6.0, right: 4),
                        child: Row(
                          children: [
                            Text('más',
                                style: TextStyle(
                                    fontSize: 15 * ScreenUtil().scaleText)),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: ScreenUtil().setHeight(250),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    height: ScreenUtil().setHeight(250),
                    width: ScreenUtil().setWidth(200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            height: ScreenUtil().setHeight(170),
                            width: ScreenUtil().setWidth(170),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        SizedBox(height: 10),
                        Flexible(
                          child: Text(
                            '¿Está gran bretaña preparada para el covid 19?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: subtitleColor,
                              fontSize: 14 * ScreenUtil().scaleText,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
