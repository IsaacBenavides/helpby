import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mydoctor/Widget/Constants.dart';
import 'package:mydoctor/Widget/CustomDivider.dart';
import 'package:mydoctor/tab/model/NotificationsModels.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool isRead = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
            child: Row(
              children: [
                Text(
                  'Notificación',
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 30,
                    fontFamily: 'Poppins',
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    _confirmation(context).then(
                      (value) {
                        setState(
                          () {
                            if (value == null) {
                              isRead = isRead;
                            } else {
                              isRead = value;
                            }
                          },
                        );
                      },
                    );
                  },
                  child: SvgPicture.asset('assets/Icons/Tick.svg'),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              return ContainNotifications(
                index: index,
                date: notifications[index].date,
                title: notifications[index].title,
                subtitle: notifications[index].subtitle,
                isRead: isRead,
              );
            },
          )),
        ],
      ),
    );
  }

  Future<bool> _confirmation(BuildContext context) {
    bool isConfirm = false;
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text(
              '¿Marcar todo como leido?',
              style: TextStyle(
                  color: titleColor, fontFamily: 'Poppins', fontSize: 16),
            ),
            content: Text(
              'Todas las notificaciones no leídas se marcarán como leídas.',
              style: TextStyle(color: subtitleColor, fontFamily: 'Poppins'),
            ),
            actions: [
              FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancelar'),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    isConfirm = true;
                  });
                  Navigator.of(context).pop(isConfirm);
                },
                child: Text('Confirmar'),
              )
            ],
          );
        });
  }
}

class ContainNotifications extends StatelessWidget {
  const ContainNotifications(
      {Key key,
      this.title,
      this.subtitle = textExample,
      this.date,
      this.index,
      this.isRead})
      : super(key: key);

  final String title;
  final String subtitle;
  final String date;
  final bool isRead;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          CustomDivider(),
          Notifications(
            date: date,
            title: title,
            subtitle: subtitle,
            isRead: isRead,
            index: index,
          ),
        ],
      ),
    );
  }
}

class Notifications extends StatelessWidget {
  Notifications({
    Key key,
    @required this.date,
    @required this.title,
    @required this.subtitle,
    this.index,
    this.isRead,
  }) : super(key: key);

  final String date;
  final String title;
  final String subtitle;
  final bool isRead;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: TextStyle(color: subtitleColor, fontSize: 12),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                    color: isRead == false ? titleColor : subtitleColor,
                    fontFamily: 'Poppins',
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: Text(
                subtitle,
                style: TextStyle(
                    color: subtitleColor, fontFamily: 'Poppins', fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
