import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNavigator extends StatefulWidget {
  final List<IconData> items;
  final ValueChanged<int> onTapChanged;
  final initialIndex;
  CustomNavigator({
    Key key,
    @required this.items,
    @required this.onTapChanged,
    this.initialIndex = 0,
  }) : super(key: key);
  @override
  _CustomNavigatorState createState() => _CustomNavigatorState();
}

class _CustomNavigatorState extends State<CustomNavigator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation _upYourPosition;

  int _currentIndex;
  int _pressed = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex ?? 0;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _upYourPosition = CurveTween(
      curve: Interval(
        0.0,
        0.5,
        curve: Curves.decelerate,
      ),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBottomNavigationBarHeight,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
              spreadRadius: 5,
              offset: Offset(0.0, 1),
            ),
          ],
        ),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                widget.items.length,
                (index) {
                  final child = widget.items[index];
                  if (index == _currentIndex) {
                    return Expanded(
                      child: Transform.translate(
                        offset: Offset(
                            0.0,
                            (_pressed == 0)
                                ? (-kBottomNavigationBarHeight / 4)
                                : (-kBottomNavigationBarHeight / 4) *
                                    _upYourPosition.value),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 1000,
                          child: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 239, 113, 107),
                            radius: 1000.0,
                            child: Icon(
                              child,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.onTapChanged(index);
                            _pressed++;
                            _currentIndex = index;
                          });
                          _controller.forward(from: 0.0);
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            child,
                            color: Color.fromARGB(255, 90, 89, 135),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
