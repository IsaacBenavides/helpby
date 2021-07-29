import 'package:flutter/material.dart';

class Benefit {
  final String title;
  final String icon;
  final String subtitle;

  Benefit({@required this.title, @required this.icon, @required this.subtitle});
}

final benefit = <Benefit>[
  Benefit(
      title: 'Tome muestra en su casa',
      icon: 'assets/Icons/Home.svg',
      subtitle: 'Nuestros enfermeros irán y tomarán las muestras en su casa.'),
  Benefit(
      title: 'Consulta en linea',
      icon: 'assets/Icons/Doctor1.svg',
      subtitle:
          'Obtenga asesoramiento de nuestros médicos profesionales y de renombre.'),
  Benefit(
      title: 'El resultado se envía directamente a tu móvil',
      icon: 'assets/Icons/Phone.svg',
      subtitle:
          'El resultado del chequeo se enviará a su teléfono de inmediato.'),
];
