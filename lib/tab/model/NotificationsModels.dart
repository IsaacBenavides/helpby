import 'package:mydoctor/Widget/Constants.dart';

class Notifications {
  final String title;
  final String subtitle;
  final String date;

  Notifications(this.title, this.subtitle, this.date);
}

final notifications = <Notifications>[
  Notifications('¡¡El proceso COVID-19 ataca el cuerpo humano !!', textExample,
      'March 11, 2020'),
  Notifications(
      '¿Sistema inmunológico natural humano?', textExample, 'March 11, 2020'),
  Notifications('La OMS declara el brote de COVID-19 como una pandemia',
      textExample, 'March 11, 2020')
];
