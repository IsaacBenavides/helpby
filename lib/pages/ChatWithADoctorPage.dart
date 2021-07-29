import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydoctor/Bloc/Provider.dart';

import 'package:mydoctor/Widget/Constants.dart';
import 'package:mydoctor/pages/ChatWithaDoctor.dart';
import 'package:mydoctor/pages/EmptyChatWithaDoctor.dart';
import 'package:mydoctor/pages/HomePage.dart';

class ChatWithADoctorPage extends StatefulWidget {
  const ChatWithADoctorPage({Key key}) : super(key: key);

  @override
  _ChatWithADoctorPageState createState() => _ChatWithADoctorPageState();
}

class _ChatWithADoctorPageState extends State<ChatWithADoctorPage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    final bloc = Provider.of3(context);
    final lista = bloc.chatSelected;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Chatear con un Doctor',
          style: TextStyle(color: titleColor, fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
          iconSize: 16,
          icon: Icon(
            Icons.arrow_back_ios,
            color: titleColor,
          ),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          ),
        ),
      ),
      body: lista == null
          ? EmptyChatWithaDoctor()
          : ChatWithaDoctor(width: _width),
    );
  }
}
