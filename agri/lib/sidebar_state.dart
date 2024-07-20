import 'package:flutter/material.dart';

class SidebarState with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void selectIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}