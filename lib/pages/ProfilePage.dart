import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mydoctor/Bloc/Provider.dart';

import 'package:mydoctor/Widget/Constants.dart';
import 'package:mydoctor/pages/PaymentMethodsPage.dart';
import 'package:mydoctor/pages/PersonalInfoPage.dart';
import 'package:mydoctor/pages/login_page.dart';

import 'package:mydoctor/tab/model/ProfileModel.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          itemCount: profiles.length + 2,
          itemBuilder: (context, index) => Contain(index: index),
        ),
      ),
    );
  }
}

class Contain extends StatelessWidget {
  final index;
  final list = profiles;

  Contain({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Container(
      padding: index == 0
          ? EdgeInsets.only(top: 30, bottom: 30)
          : index == 1
              ? EdgeInsets.only(bottom: 30)
              : EdgeInsets.only(top: 0),
      width: _width,
      child: index == 0
          ? HeadProfile()
          : index == 1
              ? Remaining()
              : Settings(index: index),
    );
  }
}

class HeadProfile extends StatelessWidget {
  const HeadProfile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Perfil',
            style: TextStyle(
                fontSize: 30, color: titleColor, fontFamily: 'Poppins'),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PersonalInfoPage(),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38.withOpacity(0.08),
                        blurRadius: 20,
                        spreadRadius: 0.5,
                        offset: Offset(10, 15),
                      )
                    ],
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 8),
                      child: Text(
                        'Dimitri Petronko',
                        style: TextStyle(
                            color: titleColor,
                            fontSize: 25 * ScreenUtil().scaleText,
                            height: 1,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, right: 10),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 17,
                    color: Colors.blueAccent,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Remaining extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 17),
      height: 52,
      width: 327,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.black12.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 2)
        ],
      ),
      child: RaisedButton(
        color: Colors.transparent,
        elevation: 0,
        onPressed: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'boleto de aviso restante',
              style: TextStyle(
                  fontSize: 15, fontFamily: 'Poppins', color: secondColor),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 17,
              color: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}

class Settings extends StatelessWidget {
  final int index;

  const Settings({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of1(context);
    return Column(
      children: [
        (index - 2 < 7 && index - 2 != 3)
            ? InkWell(
                splashColor: Colors.grey,
                onTap: () {},
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset(profiles[index - 2].iconData),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        profiles[index - 2].title,
                        style: TextStyle(
                            color: index - 2 == 7 ? primaryColor : secondColor,
                            fontFamily: 'Poppins',
                            fontSize: 15),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 17,
                          color: Colors.blueAccent,
                        ),
                      )
                    ],
                  ),
                ),
              )
            : index - 2 == 3
                ? InkWell(
                    splashColor: Colors.grey,
                    onTap: () {
                      bloc.drainStream();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PaymentMethodsPage(),
                      ));
                    },
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          SvgPicture.asset(profiles[index - 2].iconData),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            profiles[index - 2].title,
                            style: TextStyle(
                                color: subtitleColor,
                                fontFamily: 'Poppins',
                                fontSize: 15),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 17,
                              color: Colors.blueAccent,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : InkWell(
                    splashColor: Colors.grey,
                    onTap: () {
                      bloc.drainStream();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                          (Route<dynamic> route) => false);
                    },
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          SvgPicture.asset(profiles[index - 2].iconData),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            profiles[index - 2].title,
                            style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'Poppins',
                                fontSize: 15),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 17,
                              color: Colors.blueAccent,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
        index - 2 == 7
            ? SizedBox(
                height: 50,
              )
            : SizedBox()
      ],
    );
  }
}
