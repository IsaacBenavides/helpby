class Profile {
  final String iconData;
  final String title;
  final route;

  Profile({this.route, this.iconData, this.title});
}

final profiles = <Profile>[
  Profile(iconData: 'assets/Icons/User.svg', title: 'Configuración de perfil'),
  Profile(iconData: 'assets/Icons/History.svg', title: 'Preguntas Frecuentes'),
  Profile(iconData: 'assets/Icons/Address.svg', title: 'Dirección'),
  Profile(iconData: 'assets/Icons/PaymentMethod.svg', title: 'Método de pago'),
  Profile(iconData: 'assets/Icons/Help.svg', title: 'Centro de ayuda'),
  Profile(iconData: 'assets/Icons/Hotline.svg', title: 'Línea Directa'),
  Profile(iconData: 'assets/Icons/Info.svg', title: 'Sobre nosotros'),
  Profile(iconData: 'assets/Icons/Logout.svg', title: 'Cerrar sesión'),
];
