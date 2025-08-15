import 'package:flutter/material.dart';

class InputValidationUtils {
  static bool validateForm(BuildContext context, GlobalKey<FormState> formKey, {bool isFormSubmit = false}) {
    final bool valid = formKey.currentState?.validate() ?? false;
    if (!valid && isFormSubmit) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Oh neim :("
          ),
        ),
      );
    }
    return valid;
  }
}