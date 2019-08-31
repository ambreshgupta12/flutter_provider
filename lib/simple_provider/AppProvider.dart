import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier{


  String _displayText = "";

  void setDisplayText(String text) {
    _displayText = text;
    notifyListeners();
  }

  String get getDisplayText => _displayText;

  AppProvider();








}


