import 'dart:async';

import 'package:formvalidation/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwdController = BehaviorSubject<String>();

  // Recuperar datos del Stream
  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passwdStream => _passwdController.stream.transform(validarPasswd);

  Stream<bool> get formValidStream => Rx.combineLatest2(emailStream, passwdStream, (e, p) => true);

  // Insertar Valores al stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePasswd => _passwdController.sink.add;

  // Obtener ultimo valor ingresado GET an SET
  String get email => _emailController.value;
  String get passwd => _passwdController.value;

  disposed() {
    _emailController?.close();
    _passwdController?.close();
  }

}