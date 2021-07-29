import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mydoctor/Bloc/Provider.dart';
import 'package:mydoctor/Widget/SizeConfig.dart';
import 'package:mydoctor/pages/ChatWithADoctorPage.dart';
import 'package:mydoctor/pages/ChatWithaDoctor.dart';
import 'package:mydoctor/pages/DetailPage.dart';
import 'package:mydoctor/pages/EmptyChatWithaDoctor.dart';
import 'package:mydoctor/pages/HomePage.dart';
import 'package:mydoctor/pages/ProfilePage.dart';
import 'package:mydoctor/pages/ServicePage.dart';
import 'package:mydoctor/pages/login_page.dart';

import 'package:mydoctor/tab/model/introduction_screen.dart';

import 'package:mydoctor/signup_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Provider(child: LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            SizeConfig().init(constraints, orientation);
            return ScreenUtilInit(
              designSize: Size(412, 844),
              builder: () {
                return MaterialApp(
                  localizationsDelegates: [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: [
                    const Locale('en', ''),
                    const Locale('es', 'ES'),
                  ],
                  title: 'HelpBy',
                  debugShowCheckedModeBanner: false,
                  theme: Theme.of(context).copyWith(
                    backgroundColor: Colors.white,
                    unselectedWidgetColor: Colors.black26,
                  ),
                  routes: {
                    '/': (BuildContext context) => OnBoardingPage(),
                    'login': (BuildContext context) => LoginPage(),
                    'homePage': (BuildContext context) => HomePage(),
                    'signup': (BuildContext context) => SignUpPage(),
                    'service': (BuildContext context) => ServicePage(),
                    'details': (BuildContext context) => DetailPage(),
                    'profile': (BuildContext context) => ProfilePage(),
                    'EmptyChatDoctor': (BuildContext context) =>
                        EmptyChatWithaDoctor(),
                    'ChatDoctor': (BuildContext context) => ChatWithaDoctor(),
                    'Chat': (BuildContext context) => ChatWithADoctorPage(),
                    // ChatWithADoctorPage
                  },
                );
              },
            );
          },
        );
      },
    ));
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.pushNamed(context, 'login');
  }

  Widget _buildImage(String assetName) {
    return Container(
      child: SvgPicture.asset('assets/slider/$assetName',
          width: ScreenUtil().setWidth(170),
          height: ScreenUtil().setHeight(300)),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: Color(0xFF5A5987));
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w600,
          color: Color(0xFF0C0B52)),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.only(top: 100, bottom: 20),
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Consejos de salud",
          body:
              "Chatee y obtenga consejos de salud \nde médicos experimentados.",
          footer: _buildImage('illus1.svg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Chequeo a domicilio",
          body:
              "Las muestras se toman en casa. \n Proporciona resultados rápidos y precisos",
          footer: _buildImage('Illus2.svg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Tiempo flexible",
          body: "Elija tiempo de muestreo y chequeo \n tiempo en su demanda.",
          footer: _buildImage('illus.svg'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Saltar',
          textAlign: TextAlign.end,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Color(0xFF5A5987))),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Hecho', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(5.0, 7.0),
        color: Color(0xFF979797),
        activeColor: Color(0xFFEF716B),
        activeSize: Size(22.0, 5.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
