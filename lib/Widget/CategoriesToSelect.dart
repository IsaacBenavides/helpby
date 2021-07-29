import 'package:flutter/material.dart';
import 'package:mydoctor/Widget/Constants.dart';

class CategoriesToSelect extends StatefulWidget {
  final ValueChanged<int> onTapChanged;
  final List<String> categories;

  const CategoriesToSelect(
      {Key key, @required this.onTapChanged, @required this.categories})
      : super(key: key);
  @override
  _CategoriesToSelectState createState() => _CategoriesToSelectState();
}

class _CategoriesToSelectState extends State<CategoriesToSelect> {
  int _ontap = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      child: ListView.builder(
        itemCount: widget.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                widget.onTapChanged(index);
                _ontap = index;
              });
            },
            child: Container(
              height: 20,
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      widget.categories[index],
                      style: TextStyle(
                          color: _ontap == index ? titleColor : subtitleColor),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    _ontap == index
                        ? Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.5),
                                color: titleColor),
                          )
                        : Container()
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
