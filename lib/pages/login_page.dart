import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mydoctor/Bloc/LoginBloc.dart';
import 'package:mydoctor/Bloc/Provider.dart';

import 'package:mydoctor/Widget/Constants.dart';
import 'package:mydoctor/Widget/SizeConfig.dart';
import 'package:mydoctor/Widget/SocialButtons.dart';
import 'package:mydoctor/pages/HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _checkValue = false;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _widht = MediaQuery.of(context).size.width;
    final query = MediaQuery.of(context);
    return MediaQuery(
      data: query.copyWith(
          textScaleFactor: query.textScaleFactor.clamp(0.8, 1.2)),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              _height >= 692
                  ? SizedBox(height: kToolbarHeight + 50)
                  : SizedBox(
                      height: 40,
                    ),
              _textStart(context: context, height: _height, widht: _widht),
              _inputsField(context: context, height: _height, widht: _widht),
              _randFP(
                context: context,
                height: _height,
                widht: _widht,
              ),
              _buttons(context: context, height: _height, widht: _widht),
              Container(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  _textStart({BuildContext context, double height, double widht}) {
    return Container(
      height: height * 0.25,
      // decoration: BoxDecoration(color: Colors.red),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Iniciar Sesión',
            style: TextStyle(
              color: Color(0xFF0C0B52),
              fontSize: 5 * SizeConfig.textMultiplier,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "¿No tienes una cuenta?",
                style: TextStyle(
                  color: Color(0xFF5A5987),
                  fontSize: 2 * SizeConfig.textMultiplier,
                ),
              ),
              GestureDetector(
                child: Text(
                  ' Regístrate',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 2 * SizeConfig.textMultiplier,
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'signup');
                },
              ),
            ],
          ),
          GestureDetector(
            child: Text(
              'ahora!',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 2 * SizeConfig.textMultiplier,
              ),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'signup');
            },
          ),
        ],
      ),
    );
  }

  _inputsField({BuildContext context, double height, double widht}) {
    final bloc = Provider.of1(context);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: widht - widht * 0.95),
          width: 85 * SizeConfig.widthMultiplier,
          child: Column(
            children: [
              _inputEmail(
                height: height,
                widht: widht,
                bloc: bloc,
              ),
              SizedBox(height: 20),
              _inputPassword(
                height: height,
                widht: widht,
                bloc: bloc,
              ),
            ],
          ),
        )
        //
        //
      ],
    );
  }

  _inputEmail({double height, double widht, LoginBloc bloc}) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(200, 239, 113, 107),
                ),
              ),
              // fillColor: Color.fromARGB(200, 239, 113, 107)
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
              errorText: snapshot.error,
              errorStyle: TextStyle(fontSize: 10.0),
              labelText: 'Correo',
              labelStyle: TextStyle(
                color: Color.fromARGB(200, 150, 150, 150),
              ),
            ),
            onChanged: bloc.changeEmail,
          );
        });
  }

  _inputPassword({double height, double widht, LoginBloc bloc}) {
    return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return TextField(
            obscureText: true,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(200, 239, 113, 107),
                ),
              ),
              // fillColor: Color.fromARGB(200, 239, 113, 107),

              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
              errorText: snapshot.error,
              labelText: 'Contraseña',
              labelStyle: TextStyle(color: Color.fromARGB(200, 150, 150, 150)),
            ),
            onChanged: bloc.changePassw,
          );
        });
  }

  _randFP({
    BuildContext context,
    double height,
    double widht,
  }) {
    print("height $height");
    print("width $widht");
    return Padding(
      padding: EdgeInsets.only(
          left: 15.0,
          right: 20.0,
          top: 0.5 * SizeConfig.heightMultiplier,
          bottom: 0.5 * SizeConfig.heightMultiplier),
      child: Container(
        width: 90 * SizeConfig.widthMultiplier,
        height: 5 * SizeConfig.heightMultiplier,
        child: Row(
          children: [
            Checkbox(
              // checkColor: Colors.grey,
              value: _checkValue,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeColor: Color.fromARGB(200, 239, 113, 107),
              onChanged: (bool value) {
                setState(() {
                  _checkValue = value;
                });
              },
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _checkValue = !_checkValue;
                });
              },
              child: Text(
                'Recuerdame',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: SizeConfig.screenHeight > 900 &&
                            SizeConfig.screenWidth > 600
                        ? 2.5 * SizeConfig.textMultiplier
                        : widht < 352
                            ? 12
                            : 14),
              ),
            ),
            Spacer(),
            Text(
              '¿Se te olvidó tu contraseña?',
              style: TextStyle(
                  color: subtitleColor,
                  fontSize: SizeConfig.screenHeight > 900 &&
                          SizeConfig.screenWidth > 600
                      ? 2.5 * SizeConfig.heightMultiplier
                      : widht < 352
                          ? 12
                          : 14),
            )
          ],
        ),
      ),
    );
  }

  _buttons({BuildContext context, double height, double widht}) {
    final bloc = Provider.of1(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: widht - widht * 0.95),
      child: Column(
        children: [
          _btnGetIntro(bloc, widht, height),
          SizedBox(height: 10),
          Center(
            child: Text(
              'O',
              style: TextStyle(
                color: Color(0xFF0C0B52),
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(height: 10),
          FacebookButton(),
          SizedBox(height: 10),
          GoogleButton(),
        ],
      ),
    );
  }

  _btnGetIntro(LoginBloc bloc, double widht, double height) {
    return StreamBuilder(
      stream: bloc.enableButton,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return SizedBox(
          width: SizeConfig.screenHeight > 900 ? 700 : 320,
          height: SizeConfig.screenHeight > 900 ? 60 : 48,
          child: RaisedButton(
              color: Color.fromARGB(255, 239, 113, 107),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  "Iniciar Sesión",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.screenHeight > 900
                          ? 2 * SizeConfig.textMultiplier
                          : 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: snapshot.hasData
                  ? () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (BuildContext context) => HomePage()),
                          (Route<dynamic> route) => false);
                    }
                  : null),
        );
      },
    );
  }
}
