import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mydoctor/Bloc/Provider.dart';

import 'package:mydoctor/Widget/Constants.dart';
import 'package:mydoctor/pages/DoctorDetail.dart';
import 'package:mydoctor/pages/HomePage.dart';

import 'package:mydoctor/tab/model/ChatModel.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class EmptyChatWithaDoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final bloc = Provider.of3(context);
    final _list = bloc.chatSelected;
    return Material(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (_list != null && _list.length != 0)
              ? Padding(
                  padding: const EdgeInsets.only(top: 22.0, left: 8),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomePage(),
                        )),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 17,
                        ),
                      )
                    ],
                  ),
                )
              : SizedBox(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: double.infinity,
              height: 200,
              child: SvgPicture.asset('assets/Icons/message.svg'),
            ),
          ),
          Text(
            'Obtenga el consejo de un nuevo médico ahora',
            style: TextStyle(
                color: subtitleColor, fontFamily: 'Poppins', fontSize: 13),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  'Elegir doctor',
                  style: TextStyle(
                      color: titleColor, fontFamily: 'Poppins', fontSize: 17),
                ),
                Spacer(),
                Row(
                  children: [
                    Text('Ver todo', style: TextStyle(color: Colors.blue)),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 10,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: _Grid(),
          ),
        ],
      ),
    );
  }
}

class _Grid extends StatelessWidget {
  const _Grid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      padding: EdgeInsets.symmetric(horizontal: 20),
      itemCount: chatToDoctor.length,
      itemBuilder: (BuildContext context, int index) {
        final _specialty = chatToDoctor[index].specialty;
        return _StaggeredBuilder(specialty: _specialty, index: index);
      },
      staggeredTileBuilder: (int index) {
        final _specialty = chatToDoctor[index].specialty;
        return StaggeredTile.count(
            2,
            _specialty.length > 2
                ? 2.5
                : (_specialty.length <= 2 && _specialty.length > 1)
                    ? 2.2
                    : 2.0);
      },
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
    );
  }
}

class _StaggeredBuilder extends StatelessWidget {
  final List<String> specialty;
  final int index;

  const _StaggeredBuilder({Key key, this.specialty, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DoctorDetailPage(
            doctor: chatToDoctor[index],
          ),
        ),
      ),
      child: Container(
        width: 156,
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: Offset(0.0, 3.0),
                          blurRadius: 9,
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 102,
                    child: Text(chatToDoctor[index].name,
                        style: TextStyle(
                            color: titleColor,
                            fontSize: 16,
                            fontFamily: 'Poppins')),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      specialty.length,
                      (index) {
                        return Text(
                          specialty[index],
                          style: TextStyle(color: secondColor),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: 28,
                width: 62,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.star, color: Colors.white),
                    Text(
                      '4.5',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
