import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mydoctor/Widget/CategoriesToSelect.dart';
import 'package:mydoctor/Widget/Constants.dart';
import 'package:mydoctor/Widget/Search.dart';
import 'package:mydoctor/tab/model/ChatModel.dart';

import 'DoctorDetail.dart';

class GetDoctorAdvicePage extends StatefulWidget {
  @override
  _GetDoctorAdvicePageState createState() => _GetDoctorAdvicePageState();
}

class _GetDoctorAdvicePageState extends State<GetDoctorAdvicePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Lista de Doctores',
          style:
              TextStyle(color: titleColor, fontFamily: 'Poppins', fontSize: 25),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: titleColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          CategoriesToSelect(
              onTapChanged: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              categories: [
                'General',
                'Endocrino',
                'Dentista',
                'Ortopedista',
                'Cirugía'
              ]),
          SizedBox(height: 10),
          IndexedStack(
            index: _currentIndex,
            children: [
              Container(
                width: _width,
                height: _height - 172,
                child: _Grid(),
              ),
              Container(
                child: Text('Endocrino'),
              ),
              Container(
                child: Text('Dentista'),
              ),
              Container(
                child: Text('Ortopedista'),
              ),
              Container(
                child: Text('Cirugia'),
              ),
            ],
          )
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
