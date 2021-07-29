import 'package:flutter/material.dart';
import 'package:mydoctor/Widget/Constants.dart';

class Search extends StatelessWidget {
  final String descriptions;

  const Search({Key key, @required this.descriptions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
      child: GestureDetector(
        child: Container(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: primaryColor),
              ),
              suffixIcon: Icon(Icons.search, color: secondColor),
              hintText: descriptions,
              hintStyle: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  height: 3.5,
                  color: subtitleColor.withOpacity(0.5)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
