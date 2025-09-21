import 'package:flutter/material.dart';

class VerifyNumberViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
}
