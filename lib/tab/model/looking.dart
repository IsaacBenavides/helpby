import 'package:flutter/material.dart';
import 'package:mydoctor/pages/ChatWithADoctorPage.dart';
import 'package:mydoctor/pages/GetDoctorAdvicePage.dart';
import 'package:mydoctor/pages/NewsPage.dart';
import 'package:mydoctor/pages/ServicePage.dart';

class Looking {
  final String title;
  final String icon;
  final Color color;
  final routes;

  Looking({this.routes, this.title, this.icon, this.color});
}

final items = <Looking>[
  Looking(
      title: 'Revisión general',
      icon: 'assets/Icons/Body.svg',
      color: Color.fromARGB(255, 73, 125, 249),
      routes: ServicePage()),
  Looking(
      title: 'Chatear con un doctor',
      icon: 'assets/Icons/Q.svg',
      color: Color.fromARGB(255, 255, 177, 103),
      routes: ChatWithADoctorPage()),
  Looking(
      title: 'Noticias de Salud',
      icon: 'assets/Icons/News.svg',
      color: Color.fromARGB(255, 239, 113, 107),
      routes: NewsPage()),
  Looking(
      title: 'Obtenga asesoramiento médico',
      icon: 'assets/Icons/Doctor.svg',
      color: Color.fromARGB(255, 73, 187, 95),
      routes: GetDoctorAdvicePage()),
];
