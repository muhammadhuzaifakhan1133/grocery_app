import 'package:flutter/material.dart';

class AddAddressViewModel extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  bool isDefault = false;

  void toggleDefault() {
    isDefault = !isDefault;
    notifyListeners();
  }
}
