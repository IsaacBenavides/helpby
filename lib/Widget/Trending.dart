import 'package:flutter/material.dart';

import 'Constants.dart';

class Trending extends StatelessWidget {
  final double width;

  const Trending({
    Key key,
    @required this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(4, (index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Container(
                height: 96,
                width: 96,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Noticias',
                          style: TextStyle(color: Colors.blue, fontSize: 20)),
                      Spacer(),
                      Text(
                        '11 de Marzo . 2020',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    textExample,
                    maxLines: 3,
                    style: TextStyle(fontFamily: 'Poppins'),
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
