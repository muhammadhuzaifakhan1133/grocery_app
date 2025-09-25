import 'package:flutter/material.dart';
import 'package:grocery_app/ui/home/home_view.dart';

class HomeNavigationController extends ChangeNotifier {
  int currentIndex = 0;



  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}