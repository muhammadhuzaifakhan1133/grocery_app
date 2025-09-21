import 'package:grocery_app/constants/app_strings.dart';

class FieldValidators {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.emailValidation1;
    }
    // Simple email regex
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return AppStrings.emailValidation2;
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordValidation1;
    }
    if (value.length < 6) {
      return AppStrings.passwordValidation2;
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.phoneValidation1;
    }
    // Simple phone number regex (10 digits)
    String pattern = r'^\d{10}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return AppStrings.phoneValidation2;
    }
    return null;
  }

  static String? otpValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.otpValidation1;
    }
    if (value.length != 6) {
      return AppStrings.otpValidation2;
    }
    if (!RegExp(r'^\d{6}$').hasMatch(value)) {
      return AppStrings.otpValidation3;
    }
    return null;
  }
}
