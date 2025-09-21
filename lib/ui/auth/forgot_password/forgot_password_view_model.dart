import 'package:flutter/material.dart';

class ForgotPasswordViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
}
