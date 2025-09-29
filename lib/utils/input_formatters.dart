import 'package:flutter/services.dart';

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove any non-digit characters
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    String newText = '';

    for (int i = 0; i < digitsOnly.length; i++) {
      if (i % 4 == 0 && i != 0) {
        newText += ' '; // Add space every 4 digits
      }
      newText += digitsOnly[i];
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}


class ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    String newText = '';

    if (digitsOnly.length >= 2) {
      newText = digitsOnly.substring(0, 2);
      if (digitsOnly.length > 2) {
        newText += '/${digitsOnly.substring(2, digitsOnly.length.clamp(2, 4))}';
      }
    } else {
      newText = digitsOnly;
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

