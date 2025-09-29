import 'package:flutter/material.dart';

class AddCreditCardViewModel extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  bool makeDefault = false;

  void toggleDefaultValue() {
    makeDefault = !makeDefault;
    notifyListeners();
  }

  AddCreditCardViewModel() {
    nameController.addListener(() {
      notifyListeners();
    });
    numberController.addListener(() {
      notifyListeners();
    });
    expiryController.addListener(() {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    expiryController.dispose();
    super.dispose();
  }
}