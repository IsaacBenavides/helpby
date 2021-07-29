import 'dart:async';

import 'package:mydoctor/tab/model/ChatModel.dart';
import 'package:rxdart/rxdart.dart';

class DoctorToChatBloc {
  int incremento = 0;
  final anteriores = new List<Chat>();
  final _chatStreamController = BehaviorSubject();

  Stream get chatStream => _chatStreamController.stream;

  List<Chat> get chatSelected => _chatStreamController.value;

  void setChat(Chat doctor) {
    incremento == 0
        ? _chatStreamController.value = new List<Chat>()
        : _chatStreamController.value = anteriores;

    if (incremento == 0) {
      anteriores.add(doctor);
      _chatStreamController.value.add(doctor);
    } else {
      anteriores.add(doctor);
    }

    incremento++;
  }

  void dispose() {
    _chatStreamController?.close();
  }
}
