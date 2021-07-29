import 'package:flutter/material.dart';
import 'package:mydoctor/Widget/Constants.dart';

class SelectedHospitalPage extends StatefulWidget {
  @override
  _SelectedHospitalPageState createState() => _SelectedHospitalPageState();
}

class _SelectedHospitalPageState extends State<SelectedHospitalPage> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Hospital/Clinica',
          style: TextStyle(color: titleColor, fontFamily: 'Poppins'),
        ),
        centerTitle: true,
        leading: IconButton(
            color: titleColor,
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 15,
            onPressed: () => Navigator.of(context).pop()),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          _Hospitals(
            isSelected: isSelected,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      spreadRadius: 5,
                      offset: Offset(0.0, 2.0))
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 50),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: RaisedButton(
                    color: primaryColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Siguiente',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _width > 353
                            ? 17
                            : _width > 325
                                ? 13
                                : 11,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//ignore: must_be_immutable
class _Hospitals extends StatefulWidget {
  final int index;
  bool isSelected;
  _Hospitals({Key key, this.index, this.isSelected}) : super(key: key);

  @override
  __HospitalsState createState() => __HospitalsState();
}

class __HospitalsState extends State<_Hospitals> {
  int _currentIndex;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              widget.isSelected = true;
              _currentIndex = index;
            });
          },
          child: Container(
            width: double.maxFinite,
            height: 112,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(blurRadius: 8, color: Colors.black26, spreadRadius: 3)
              ],
              border: Border.all(
                  color: _currentIndex == index ? primaryColor : Colors.white),
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 88,
                  width: 88,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 10),
                _Information(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            'Jolow quacky hospital',
            style: TextStyle(
                color: titleColor, fontFamily: 'Poppins', fontSize: 17),
          ),
        ),
        SizedBox(height: 4),
        Container(
          child: Text('99 Crown Street London city'),
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Icon(
              Icons.pin_drop,
              color: primaryColor,
            ),
            Text(
              '2,4 miles',
              style: TextStyle(color: primaryColor),
            )
          ],
        )
      ],
    );
  }
}
