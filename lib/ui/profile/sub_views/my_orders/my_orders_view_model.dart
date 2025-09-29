import 'package:flutter/material.dart';

class MyOrdersViewModel extends ChangeNotifier {
  List<bool> isExpand = [false, false, false, false];

  void toggleExpand(int index) {
    for (var i = 0; i < isExpand.length; i++) {
      if (i != index) {
        isExpand[i] = false;
      }
    }
    isExpand[index] = !isExpand[index];
    notifyListeners();
  }
}
