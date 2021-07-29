import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.grey.withOpacity(.7),
      height: 1,
      width: _width,
    );
  }
}
