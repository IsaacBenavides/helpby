import 'dart:async';

class Validator {
  final vemail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);

    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Email no valido ');
    }
  });
  final con = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    Pattern characters = r'[!#%@&\$*-+:;/()=?¡¿]';
    RegExp regExp = new RegExp(characters);

    if (password.isEmpty) {
      sink.addError('Contraseña no puede estar vacia');
    } else if (password.length < 6) {
      sink.addError('debe tener más de 6 caracteres');
    } else if (!regExp.hasMatch(password)) {
      sink.addError('Debe contener por lo menos un caracter especial');
    } else {
      sink.add(password);
    }
  });
}
