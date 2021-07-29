import 'package:flutter/material.dart';
import 'package:mydoctor/Bloc/Provider.dart';
import 'package:mydoctor/Widget/BodyOfHomepage.dart';

import 'package:mydoctor/Widget/bottonNavigatorTap.dart';
import 'package:mydoctor/pages/CommunityPage.dart';
import 'package:mydoctor/pages/NotficationsPage.dart';
import 'package:mydoctor/pages/ProfilePage.dart';
import 'package:mydoctor/pages/SchedulePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;

    final bloc = Provider.of1(context);

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          BodyOfHomepage(),
          SchedulePage(),
          CommunityPage(),
          NotificationPage(),
          ProfilePage()
        ],
      ),
      bottomNavigationBar: CustomNavigator(
        onTapChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          Icons.home,
          Icons.local_hospital,
          Icons.group,
          Icons.notifications,
          Icons.person
        ],
      ),
    );
  }
}
