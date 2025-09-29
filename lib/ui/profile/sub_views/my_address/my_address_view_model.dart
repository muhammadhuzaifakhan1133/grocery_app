import 'package:flutter/material.dart';

class ExpandDeaultModel {
  bool isExpand;
  bool isDefault;
  ExpandDeaultModel({required this.isExpand, required this.isDefault});
}

class MyAddressViewModel extends ChangeNotifier {
  List<ExpandDeaultModel> addresses = [
    ExpandDeaultModel(isExpand: false, isDefault: true),
    ExpandDeaultModel(isExpand: false, isDefault: false),
  ];

  void toggleExpand(int index) {
    for (int i = 0; i < addresses.length; i++) {
      if (i == index) continue;
      addresses[i].isExpand = false;
    }
    addresses[index].isExpand = !addresses[index].isExpand;
    notifyListeners();
  }

  void toggleDefaultAddress(int index) {
    for (int i = 0; i < addresses.length; i++) {
      if (i == index) continue;
      addresses[i].isDefault = false;
    }
    addresses[index].isDefault = !addresses[index].isDefault;
    notifyListeners();
  }
}