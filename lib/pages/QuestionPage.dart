import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mydoctor/Widget/Constants.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  String _text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Nueva pregunta',
          style: TextStyle(color: titleColor, fontFamily: 'Poppins'),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: titleColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 52,
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black54.withOpacity(0.1))
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    top: 2,
                  ),
                  child: Row(
                    children: [SvgPicture.asset('assets/Icons/Name.svg')],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                  ),
                  maxLines: 8,
                  onChanged: (value) => setState(() {
                    _text = value;
                  }),
                ),
              )
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 3,
                        color: Colors.black38.withOpacity(0.1))
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: RaisedButton(
                    onPressed: (_text == "" || _text == null)
                        ? null
                        : () => Navigator.of(context).pop(),
                    child: Center(
                      child: Text(
                        'Enviar',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 16),
                      ),
                    ),
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
