import 'package:flutter/material.dart';
import 'package:mydoctor/Widget/SizeConfig.dart';
import 'package:mydoctor/pages/my_flutter_app_icons.dart';

class FacebookButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenHeight > 900 ? 700 : 320,
      height: SizeConfig.screenHeight > 900 ? 60 : 48,
      child: RaisedButton(
        color: Color.fromARGB(255, 59, 89, 152),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.only(left: 7.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Center(
                    child: Icon(
                      MyFlutterApp.facebook,
                      color: Colors.blue,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: SizeConfig.screenHeight > 900
                  ? 5
                  : SizeConfig.screenWidth < 281
                      ? 3
                      : 7,
              child: Center(
                child: Text(
                  "Continua con Facebook",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
            Expanded(
              child: Center(),
            )
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}

class GoogleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenHeight > 900 ? 700 : 320,
      height: SizeConfig.screenHeight > 900 ? 60 : 48,
      child: RaisedButton(
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.only(left: 7.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Center(
                    child: Icon(
                      MyFlutterApp.google,
                      color: Colors.blue,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: SizeConfig.screenHeight > 900
                  ? 5
                  : SizeConfig.screenWidth < 281
                      ? 2
                      : 7,
              child: Center(
                child: Text(
                  "Continua con Google",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
            Expanded(
              child: Center(),
            )
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
