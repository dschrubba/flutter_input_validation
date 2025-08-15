import 'package:flutter/material.dart';

class InputValidationUtils {
  static bool validateForm(
    BuildContext context,
    GlobalKey<FormState> formKey, {
    bool isFormSubmit = false,
  }) {
    final bool valid = formKey.currentState?.validate() ?? false;
    if (!valid && isFormSubmit) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Oh neim :(")));
    } else if (valid && isFormSubmit) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Alles nice :)")));
    }
    return valid;
  }

  static bool validateUsername(String? value) {
    // Allows any Unicode letters, numbers, dot, dash, underscore
    final exp = RegExp(r'^[\p{L}\p{N}._-]{4,24}$', unicode: true);
    return (value != null && value.isNotEmpty) ? exp.hasMatch(value) : false;
  }

  static bool validateMail(String? value) {
    // Generic eMail validation
    final exp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    return (value != null && value.isNotEmpty) ? exp.hasMatch(value) : false;
  }
}
