import 'package:flutter/material.dart';

class AppLanguage extends ChangeNotifier {
  String _lang = 'ru';

  String get lang => _lang;

  void changeLang(String lang) {
    _lang = lang;
    notifyListeners();
  }
}