import 'package:flutter/material.dart';

class NotificationsViewModel extends ChangeNotifier {
  bool allowNotification = true;
  bool emailNotification = true;
  bool orderNotification = true;
  bool generalNotification = true;

  void toggleAllowNotification() {
    allowNotification = !allowNotification;
    notifyListeners();
  }

  void toggleEmailNotification() {
    emailNotification = !emailNotification;
    notifyListeners();
  }

  void toggleOrderNotification() {
    orderNotification = !orderNotification;
    notifyListeners();
  }

  void toggleGeneralNotification() {
    generalNotification = !generalNotification;
    notifyListeners();
  }
}