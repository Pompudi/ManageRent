import 'package:flutter/material.dart';

class TabIndexModel extends ChangeNotifier {
  int _currentTabIndex = 0;

  int get currentTabIndex => _currentTabIndex;

  void changeTabIndex(int newIndex) {
    _currentTabIndex = newIndex;
    notifyListeners(); // Уведомляем слушателей об изменении
  }
}
