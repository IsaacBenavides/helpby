import 'package:flutter/material.dart';
import 'package:mydoctor/Widget/Constants.dart';
import 'package:mydoctor/pages/my_flutter_app_icons.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _expandedHeight = 400;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: NewsDetailSliverDelegate(expandedHeight: _expandedHeight),
          ),
          SliverToBoxAdapter(
            child: ContainTheNews(),
          )
        ],
      ),
    );
  }
}

class NewsDetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  NewsDetailSliverDelegate({this.expandedHeight});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: expandedHeight,
          color: Colors.grey,
        ),
        Positioned(
          left: 20,
          top: 30,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.black38,
            child: Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 14,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight - 20 - shrinkOffset,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    throw UnimplementedError();
  }
}

class ContainTheNews extends StatelessWidget {
  Map<Icon, Color> social = {
    Icon(
      MyFlutterApp.facebook,
      size: 13,
      color: Colors.white,
    ): facebookColor,
    Icon(
      MyFlutterApp.twitter,
      size: 13,
      color: Colors.white,
    ): twitterColor,
    Icon(
      MyFlutterApp.linkedin,
      size: 13,
      color: Colors.white,
    ): linkedInColor,
    Icon(
      MyFlutterApp.mail,
      size: 13,
      color: Colors.white,
    ): mailColor,
    Icon(
      MyFlutterApp.pinterest,
      size: 13,
      color: Colors.white,
    ): pinterestColor,
  };
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            width: _width,
            height: 35,
            child: Row(
              children: [
                Row(
                  children: List.generate(
                    5,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: social.values.toList()[index],
                          child: social.keys.toList()[index],
                        ),
                      );
                    },
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text('Compartir',
                        style: TextStyle(
                          color: subtitleColor,
                          fontFamily: 'Poppins',
                        )),
                    Icon(
                      Icons.share_outlined,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                'Síntomas de COVID-19: ¿que son y debo ver a un médico?',
                style: TextStyle(
                    color: titleColor, fontSize: 18, fontFamily: 'Poppins'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                textExample,
                style: TextStyle(color: subtitleColor, fontFamily: 'Poppins'),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 160,
                width: 327,
                color: Colors.black26,
              ),
              SizedBox(height: 15),
              Text(
                textExample,
                maxLines: 2,
                style: TextStyle(fontFamily: 'Poppins', color: subtitleColor),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }
}
