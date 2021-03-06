import 'package:flutter/material.dart';

class OnBoardingProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    if (index != currentIndex) {
      _currentIndex = index;
      notifyListeners();
    }
  }
}
