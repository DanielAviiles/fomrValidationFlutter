import 'dart:convert';

import 'package:http/http.dart' as http;

class UsuarioProvider {

  final String _firebaseToken = 'AIzaSyDFSOFAf0A8PbAjJ6DkObzAhYPu21moZg8';

  Future<Map<String, dynamic>> login(String email, String passwd) async {
    final authData = {
      'email': email,
      'password': passwd,
      'returnSecureToke': true
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
      body: json.encode(authData)
    );

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    if(decodedResp.containsKey('idToken')){
      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': true, 'mensaje': decodedResp['error']['message']};
    }
  }

  Future<Map<String, dynamic>> nuevoUsuario(String email, String passwd) async {
    final authData = {
      'email': email,
      'password': passwd,
      'returnSecureToke': true
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
      body: json.encode(authData)
    );

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    if(decodedResp.containsKey('idToken')){
      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': true, 'mensaje': decodedResp['error']['message']};
    }
  }

}