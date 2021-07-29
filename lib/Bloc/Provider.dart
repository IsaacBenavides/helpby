import 'package:flutter/material.dart';
import 'package:mydoctor/Bloc/DoctorToChatBloc.dart';
import 'package:mydoctor/Bloc/LoginBloc.dart';
import 'package:mydoctor/Bloc/SignUpBloc.dart';

export 'package:mydoctor/Bloc/LoginBloc.dart';

class Provider extends InheritedWidget {
  static Provider _instancia;

  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(key: key, child: child);
    }
    return _instancia;
  }

  final loginBloc = LoginBloc();
  final signupBloc = SignUpBloc();
  final selectedChat = DoctorToChatBloc();

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of1(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc);
  }

  static SignUpBloc of2(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>().signupBloc);
  }

  static DoctorToChatBloc of3(BuildContext context) {
    return (context
        .dependOnInheritedWidgetOfExactType<Provider>()
        .selectedChat);
  }
}
