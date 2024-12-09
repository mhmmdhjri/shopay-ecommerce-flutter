import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  String _email = '';
  String _password = '';

  bool get isLoggedIn => _isLoggedIn;
  String get email => _email;
  String get password => _password;

  AuthProvider() {
    loadAuth();
  }


  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void loadAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    print("loadAuth: $_isLoggedIn");
    notifyListeners();
  }

  void setAuth(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = status;
    await prefs.setBool("isLoggedIn", status);
    notifyListeners();
  }

  // void logout() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _isLoggedIn = false;
  //   await prefs.setBool("isLoggedIn", false);
  //   notifyListeners();
  // }
}