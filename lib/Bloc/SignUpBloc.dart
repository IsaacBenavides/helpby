import 'package:rxdart/rxdart.dart';

import 'package:mydoctor/Bloc/Validator.dart';

class SignUpBloc with Validator {
  final _emailSgUpController = BehaviorSubject<String>();
  final _passwordSgUpController = BehaviorSubject<String>();
  final _confirmpasswordSgUpController = BehaviorSubject<String>();
  final _firstNameSgUpController = BehaviorSubject<String>();
  final _lastNameSgUpController = BehaviorSubject<String>();
  final _phoneSSgUpController = BehaviorSubject<String>();

  Stream<String> get emailSgUpStream =>
      _emailSgUpController.stream.transform(vemail);
  Stream<String> get passwordSgUpStream =>
      _passwordSgUpController.stream.transform(con);
  Stream<String> get confirmpasswordSgUpStream =>
      _confirmpasswordSgUpController.stream.transform(con);
  Stream<String> get firstNameSgUpStream => _firstNameSgUpController.stream;
  Stream<String> get lastNameSgUpStream => _lastNameSgUpController.stream;
  Stream<String> get phoneSgUpStream => _phoneSSgUpController.stream;

  Stream<bool> get enableButton => Rx.combineLatest6(
      emailSgUpStream,
      passwordSgUpStream,
      confirmpasswordSgUpStream,
      firstNameSgUpStream,
      lastNameSgUpStream,
      phoneSgUpStream,
      (e, p, cp, fn, ln, ph) => true);

  String get emailSgUp => _emailSgUpController.value;
  String get passwordSgUp => _passwordSgUpController.value;
  String get confirmpasswordSgUp => _confirmpasswordSgUpController.value;
  String get firstNameSgUp => _firstNameSgUpController.value;
  String get lastNameSgUp => _lastNameSgUpController.value;
  String get phoneSgUp => _phoneSSgUpController.value;

  Function(String) get changeEmailSgUp => _emailSgUpController.sink.add;
  Function(String) get changePasswSgUp => _passwordSgUpController.sink.add;
  Function(String) get changeConfirmPasswSgUp =>
      _confirmpasswordSgUpController.sink.add;
  Function(String) get changeFirstNameSgUp => _firstNameSgUpController.sink.add;
  Function(String) get changeLastNameSgUp => _lastNameSgUpController.sink.add;
  Function(String) get changePhoneNameSgUp => _phoneSSgUpController.sink.add;

  void dispose() {
    _emailSgUpController?.close();
    _passwordSgUpController?.close();
    _confirmpasswordSgUpController?.close();
    _firstNameSgUpController?.close();
    _lastNameSgUpController?.close();
    _phoneSSgUpController?.close();
  }
}
