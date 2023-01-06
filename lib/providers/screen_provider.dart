import 'package:flutter/material.dart';

class ScreenProvider extends ChangeNotifier {
  bool isScrollFinish = false;
  double scrollPosition = 0.0;

  setScrollPosition(double position) {
    scrollPosition = position;
    notifyListeners();
  }

  setScrollFinish(bool finish) {
    isScrollFinish = finish;
    notifyListeners();
  }
}
