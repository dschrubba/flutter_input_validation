import 'package:flutter/material.dart';
import 'package:flutter_input_validation/screens/input_validation/domain/input_validation_utils.dart';

class InputValidationPassword extends StatefulWidget {
  static const String label = "Passwort";
  static const String hint = "*******";
  static const String error = "Ihr Passwort erfüllt nicht die Voraussetzungen";
  final GlobalKey<FormState> formKey;
  const InputValidationPassword({super.key, required this.formKey});

  @override
  State<InputValidationPassword> createState() => _InputValidationPasswordState();
}

class _InputValidationPasswordState extends State<InputValidationPassword> {
  String? lastError;
  final _crtl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        lastError = fieldValidator(value);
        InputValidationUtils.validateForm(context, widget.formKey);
      },
      validator: fieldValidator,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        label: Text(InputValidationPassword.label),
        hintText: InputValidationPassword.hint,
        maintainHintSize: true,
        border: UnderlineInputBorder(),
        fillColor: Theme.of(context).canvasColor,
        errorText: lastError,
      ),
      controller: _crtl,
    );
  }

    String? fieldValidator(String? input) {
    bool isValid = (input != null && input.isNotEmpty)
        ? RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
          ).hasMatch(input)
        : false;
    return !isValid ? InputValidationPassword.error : null;
  }
}