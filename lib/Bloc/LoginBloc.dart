import 'package:mydoctor/Bloc/Validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validator {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream => _emailController.stream.transform(vemail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(con);

  void drainStream() {
    _emailController.value = "";
    _passwordController.value = "";
  }

  Stream<bool> get enableButton =>
      Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);

  String get email => _emailController.value;
  String get passw => _passwordController.value;

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassw => _passwordController.sink.add;

  void dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
