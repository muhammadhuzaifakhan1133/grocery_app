import 'package:flutter/material.dart';

class AboutMeViewModel extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool obscureNewPassword = true;

  void togglePasswordVisibility() {
    obscureNewPassword = !obscureNewPassword;
    notifyListeners();
  }
}