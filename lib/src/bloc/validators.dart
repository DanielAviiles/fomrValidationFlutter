

import 'dart:async';

class Validators {

  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(pattern);

      if(regExp.hasMatch(email)){
        sink.add(email);
      }else{
        sink.addError('Email no es correcto');
      }
    }
  );

  final validarPasswd = StreamTransformer<String, String>.fromHandlers(
    handleData: (passwd, sink) {
      if(passwd.length>=6){
        sink.add(passwd);
      }else{
        sink.addError('Más de 6 caracteres');
      }
    }
  );


}