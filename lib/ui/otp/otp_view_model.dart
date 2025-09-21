import 'package:flutter/material.dart';
import 'package:grocery_app/utils/validators.dart';

class OtpViewModel extends ChangeNotifier {
  String? errorText;
  TextEditingController otpController = TextEditingController();

  void setErrorText(String? text) {
    errorText = FieldValidators.otpValidator(text);
    notifyListeners();
  }
}
