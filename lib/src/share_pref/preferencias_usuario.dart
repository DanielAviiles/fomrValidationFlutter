import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._();
  factory PreferenciasUsuario(){
    return _instancia;
  }
  PreferenciasUsuario._();
  SharedPreferences _prefs;

  initPref() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GETERS AND SETERS
  get token {
    return _prefs.getInt('token') ?? 1;
  }
  set token(int value) {
    _prefs.setInt('token', value);
  }

}