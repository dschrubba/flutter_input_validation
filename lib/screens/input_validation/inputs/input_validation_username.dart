import 'package:flutter/material.dart';
import 'package:flutter_input_validation/screens/input_validation/domain/input_validation_utils.dart';

class InputValidationUsername extends StatefulWidget {
  static const String label = "Benutzername";
  static const String hint = "ShinjiIkari";
  static const String error = "Bitte geben Sie Ihren Benutzernamen an";
  final GlobalKey<FormState> formKey;
  const InputValidationUsername({super.key, required this.formKey});

  @override
  State<InputValidationUsername> createState() => _InputValidationUsernameState();
}

class _InputValidationUsernameState extends State<InputValidationUsername> {
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
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        label: Text(InputValidationUsername.label),
        hintText: InputValidationUsername.hint,
        maintainHintSize: true,
        border: UnderlineInputBorder(),
        fillColor: Theme.of(context).canvasColor,
        errorText: lastError,
      ),
      controller: _crtl,
    );
  }

  String? fieldValidator(String? input) {
    bool isValid = (input != null && input.isNotEmpty);
    return !isValid ? InputValidationUsername.error : null;
  }

  @override
  void dispose() {
    _crtl.dispose();
    super.dispose();
  }
}
