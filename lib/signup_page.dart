import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydoctor/Bloc/SignUpBloc.dart';
import 'package:mydoctor/Widget/SocialButtons.dart';

import 'Bloc/Provider.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.red,
          child: Column(
            children: [
              size.height >= 692
                  ? SizedBox(height: kToolbarHeight + 50)
                  : SizedBox(
                      height: 40,
                    ),
              _textStart(
                  context: context, height: size.height, widht: size.width),
              _textFields(
                  context: context, height: size.height, widht: size.width),
              Container(
                height: 50.0,
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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Crear Cuenta',
              style: TextStyle(
                color: Color(0xFF0C0B52),
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "¿Tienes cuenta?",
                  style: TextStyle(
                    color: Color(0xFF5A5987),
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(
                  width: 3.0,
                ),
                GestureDetector(
                  child: Text(
                    'Entra ahora!',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14.0,
                    ),
                  ),
                  onTap: () => Navigator.pushReplacementNamed(context, 'login'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _textFields({BuildContext context, double height, double widht}) {
    TextInputType emailAddress = TextInputType.emailAddress;
    TextInputType number = TextInputType.number;
    final bloc = Provider.of2(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: widht - widht * 0.94),
      // color: Colors.blue,
      child: Column(
        children: [
          _input(
              context: context,
              stream: bloc.emailSgUpStream,
              type: emailAddress,
              bloc: bloc,
              widht: widht,
              height: height,
              label: 'Email',
              obscure: false,
              onchanged: bloc.changeEmailSgUp),
          SizedBox(height: 20),
          _input(
              context: context,
              stream: bloc.passwordSgUpStream,
              bloc: bloc,
              widht: widht,
              height: height,
              obscure: true,
              label: 'Contraseña',
              onchanged: bloc.changePasswSgUp),
          SizedBox(height: 20),
          _input(
              context: context,
              stream: bloc.confirmpasswordSgUpStream,
              bloc: bloc,
              widht: widht,
              height: height,
              label: 'Confirmar contraseña',
              obscure: true,
              onchanged: bloc.changeConfirmPasswSgUp),
          SizedBox(height: 20),
          _button(context: context, widht: widht, height: height, bloc: bloc),
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

  _input(
      {BuildContext context,
      Stream<String> stream,
      TextInputType type,
      SignUpBloc bloc,
      double widht,
      double height,
      String label,
      bool obscure,
      Function(String p1) onchanged}) {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          keyboardType: type,
          obscureText: obscure,
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
            errorStyle: TextStyle(fontSize: 12),
            labelText: label,
            labelStyle: TextStyle(
              color: Color.fromARGB(200, 150, 150, 150),
            ),
          ),
          onChanged: onchanged,
        );
      },
    );
  }

  _button(
      {BuildContext context, double widht, double height, SignUpBloc bloc}) {
    return StreamBuilder(
      stream: bloc.enableButton,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
            color: Color.fromARGB(255, 239, 113, 107),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              height: 50,
              width: widht - widht * 0.15,
              child: Center(
                child: Text(
                  "Crear tu Cuenta",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onPressed: snapshot.hasData ? () {} : null);
      },
    );
  }
}
