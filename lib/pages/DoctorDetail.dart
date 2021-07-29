import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mydoctor/Bloc/Provider.dart';
import 'package:mydoctor/Widget/Constants.dart';
import 'package:mydoctor/Widget/CustomDivider.dart';

import 'package:mydoctor/tab/model/ChatModel.dart';
import 'package:mydoctor/tab/model/ProfileModel.dart';

class DoctorDetailPage extends StatelessWidget {
  final Chat doctor;

  DoctorDetailPage({Key key, this.doctor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Información del Doctor',
          style:
              TextStyle(color: titleColor, fontFamily: 'Poppins', fontSize: 18),
        ),
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back_ios),
            color: titleColor),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              _DoctorInformation(doctor: doctor, width: _width),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 25),
                child: CustomDivider(),
              ),
              _Advice(doctor: doctor),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: CustomDivider(),
              ),
              _Profile(),
              _Specialist(),
            ],
          ),
        ),
      ),
    );
  }
}

class _DoctorInformation extends StatelessWidget {
  const _DoctorInformation({
    Key key,
    @required this.doctor,
    @required double width,
  })  : _width = width,
        super(key: key);

  final Chat doctor;
  final double _width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctor.name,
              style: TextStyle(
                  color: titleColor, fontFamily: 'Poppins', fontSize: 16),
            ),
            SizedBox(height: 10),
            Container(
              height: 30,
              width: _width * 0.6,
              child: Text(
                '${textExample}.',
              ),
            )
          ],
        ),
        Container(
          height: 88,
          width: 88,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 0.5,
                offset: Offset(0.0, 4),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _Advice extends StatelessWidget {
  final Chat doctor;

  const _Advice({Key key, this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of3(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      width: double.infinity,
      height: 75,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '2423',
                style: TextStyle(
                    color: titleColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                width: 110,
                child: Center(
                  child: Text(
                    'Tiempo de asesoramiento',
                    style: TextStyle(
                        color: subtitleColor,
                        fontFamily: 'Poppins',
                        fontSize: 14),
                  ),
                ),
              )
            ],
          ),
          SizedBox(width: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '4322',
                style: TextStyle(
                    color: titleColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 4,
              ),
              Text('Apreciado',
                  style: TextStyle(color: subtitleColor, fontFamily: 'Poppins'))
            ],
          ),
          Spacer(),
          StreamBuilder<Object>(
            stream: bloc.chatStream,
            builder: (context, _) {
              return FloatingActionButton(
                elevation: 0,
                backgroundColor: Colors.green,
                onPressed: () {
                  bloc.setChat(doctor);
                  Navigator.of(context).pushReplacementNamed('Chat');
                },
                child: Icon(
                  Icons.message,
                  color: Colors.white,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class _Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Perfil',
              style: TextStyle(
                  color: titleColor, fontSize: 25, fontFamily: 'Poppins')),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 29,
                  backgroundColor: Colors.blue.withOpacity(0.2),
                  child: SvgPicture.asset('assets/Icons/Doctor1.svg'),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Posición de trabajo',
                      style: TextStyle(
                          fontSize: 16, color: titleColor.withAlpha(1500)),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: _width * 0.73,
                      child: Text(
                        'Trabaja como decano en Jolow Quacky Hospital desde 1992.',
                        style: TextStyle(
                          fontSize: 15,
                          color: subtitleColor,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 29,
                  backgroundColor: Colors.blue.withOpacity(0.2),
                  child: SvgPicture.asset('assets/Icons/hospital(2).svg'),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Experiencia laboral',
                      style: TextStyle(
                          fontSize: 16, color: titleColor.withAlpha(1500)),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: _width * 0.73,
                      child: Text(
                        '47 años de experiencia.',
                        style: TextStyle(
                          fontSize: 15,
                          color: subtitleColor,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Specialist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Especialidades',
            style: TextStyle(
                color: titleColor, fontFamily: 'Poppins', fontSize: 20),
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              Row(
                children: [
                  _Special(
                    width: 117,
                    special: 'Ortopedista',
                    svg: 'kidney.svg',
                  ),
                  SizedBox(width: 10),
                  _Special(width: 95, special: 'Cirujano', svg: 'Heart.svg'),
                  SizedBox(width: 10),
                  _width > 360
                      ? _Special(
                          width: 87,
                          special: 'Dentista',
                          svg: 'teeth.svg',
                        )
                      : SizedBox(),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  _width <= 360
                      ? _Special(
                          width: 87,
                          special: 'Dentista',
                          svg: 'teeth.svg',
                        )
                      : SizedBox(),
                  _width <= 360
                      ? SizedBox(
                          width: 10,
                        )
                      : SizedBox(),
                  _Special(
                    width: 95,
                    special: 'Nutrición',
                    svg: 'spoon.svg',
                  ),
                  SizedBox(width: 10),
                  _width > 360
                      ? _Special(
                          width: 128,
                          special: 'Dermatología',
                          svg: 'Hair.svg',
                        )
                      : SizedBox(),
                ],
              ),
              _width <= 360
                  ? SizedBox(
                      height: 10,
                    )
                  : SizedBox(),
              _width <= 360
                  ? _Special(
                      width: 128,
                      special: 'Dermatología',
                      svg: 'Hair.svg',
                    )
                  : SizedBox(),
              SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}

class _Special extends StatelessWidget {
  final double width;
  final String special;
  final String svg;

  const _Special({Key key, this.width, this.special, this.svg})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 28,
          width: width,
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.3),
              borderRadius: BorderRadius.circular(7)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/Icons/$svg'),
              SizedBox(width: 5),
              Text(
                special,
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
        )
      ],
    );
  }
}
