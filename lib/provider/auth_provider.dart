import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  String _token = "";

  String get getToken => _token;

  void setToken(String value) {
    _token = value;
    notifyListeners();
  }
}
