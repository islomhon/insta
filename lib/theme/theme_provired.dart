import 'package:flutter/material.dart';
import 'package:instagram1/theme/dark_mode.dart';
import 'package:instagram1/theme/light_moode.dart';



class ThemeProvired extends ChangeNotifier {
//birinchi light mood
  ThemeData _themeData = light_mode;

// moodni uzgartirish

  ThemeData get themeData => _themeData;

// dark moodni ulash

  bool get isDarkmoode => _themeData == dark_mode;

// mavzuni tugirlash

  set themeData(ThemeData themedata) {
    _themeData = themedata;

//UI moodini almashtirish

    notifyListeners();
  }

// mavzuni almashtirish
  void toogleTheme() {
    if (_themeData == light_mode) {
      themeData = dark_mode;
    } else {
      themeData = light_mode;
    }
  }
}
