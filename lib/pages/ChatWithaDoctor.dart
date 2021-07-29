import 'package:flutter/material.dart';
import 'package:mydoctor/Bloc/Provider.dart';

import 'package:mydoctor/Widget/Constants.dart';
import 'package:mydoctor/tab/model/ChatModel.dart';

class ChatWithaDoctor extends StatelessWidget {
  const ChatWithaDoctor({
    Key key,
    double width,
  })  : _width = width,
        super(key: key);

  final double _width;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _chat = Provider.of3(context);
    final _doctor = _chat.chatSelected;
    return Stack(
      fit: StackFit.expand,
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Container(
                  width: _size.width,
                  child: _Chat(
                    isActive: true,
                    lista: _doctor,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'EmptyChatDoctor');
                  },
                  child: Container(
                    width: double.maxFinite,
                    height: 60,
                    decoration: BoxDecoration(
                        color: circleAvatorColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: circleAvatorColor,
                          ),
                          Text(
                            'Nueva Conversación',
                            style: TextStyle(
                                color: circleAvatorColor, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
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
                  onPressed: () {},
                  child: Text(
                    'Situación de emergencia',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: _width > 353
                            ? 17
                            : _width > 325
                                ? 13
                                : 11,
                        fontFamily: 'Poppins'),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _Chat extends StatelessWidget {
  final bool isActive;
  final List<Chat> lista;

  final Color color;

  const _Chat({Key key, this.isActive, this.lista, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Column(
      children: List.generate(lista.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            width: _width,
            height: 88,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 42,
                              backgroundColor: Colors.grey,
                            ),
                            Positioned(
                              top: 0,
                              right: 4,
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor:
                                    isActive ? Colors.green : Colors.red,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(lista[index].name,
                              style: TextStyle(
                                color: subtitleColor,
                                fontFamily: 'Poppins',
                                fontSize: _width > 339 ? 20 : 16,
                              )),
                          Text(
                            'Hola, Soy ${lista[index].name}',
                            style: TextStyle(
                              color: subtitleColor,
                              fontFamily: 'Poppins',
                              fontSize: _width > 367
                                  ? 15
                                  : _width > 336
                                      ? 13
                                      : 11,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.more_vert),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      height: 18,
                      width: 91,
                      color: color,
                      margin: EdgeInsets.only(left: 10),
                    ),
                    Spacer(),
                    Container(
                      height: 18,
                      width: 91,
                      color: Colors.grey,
                      margin: EdgeInsets.only(right: 20),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
