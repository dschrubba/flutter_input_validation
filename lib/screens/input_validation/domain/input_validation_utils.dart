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
    // print(exp.hasMatch("alex@example.com"));     // true
    // print(exp.hasMatch("alex@sub.domain.com"));  // true
    // print(exp.hasMatch("alex@my-domain.co.uk")); // true
    // print(exp.hasMatch("alex@domain-.com"));     // false
    // print(exp.hasMatch("alex@-domain.com"));     // false
    // print(exp.hasMatch("alex@domain..com"));     // false
    final exp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+\-/=?^_{|}~`]+@"        // local part
      r"(?:[a-zA-Z0-9]+(?:-[a-zA-Z0-9]+)*\.)+"      // domain + subdomains
      r"[a-zA-Z]{2,}$"                              // TLD (min 2 chars)
    );
    return (value != null && value.isNotEmpty) ? exp.hasMatch(value) : false;
  }
}
