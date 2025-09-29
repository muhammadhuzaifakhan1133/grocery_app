import 'package:flutter/material.dart';
import 'package:grocery_app/ui/home/home_view.dart';

class HomeNavigationController extends ChangeNotifier {
  
  List<IconData> icons = [Icons.home, Icons.shopping_bag_outlined, Icons.favorite_border, Icons.person_outline];
  
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}