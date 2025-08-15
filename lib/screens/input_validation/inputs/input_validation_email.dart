import 'package:flutter/material.dart';
import 'package:flutter_input_validation/screens/input_validation/domain/input_validation_utils.dart';

class InputValidationEmail extends StatefulWidget {
  static const String label = "E-Mail Adresse";
  static const String hint = "shinji.ikari@nerv.gov";
  static const String error = "Bitte geben Sie eine valide E-Mail Adresse an";
  final GlobalKey<FormState> formKey;
  const InputValidationEmail({super.key, required this.formKey});

  @override
  State<InputValidationEmail> createState() => _InputValidationEmailState();
}

class _InputValidationEmailState extends State<InputValidationEmail> {
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
        label: Text(InputValidationEmail.label),
        hintText: InputValidationEmail.hint,
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
    return !isValid ? InputValidationEmail.error : null;
  }

  @override
  void dispose() {
    _crtl.dispose();
    super.dispose();
  }
}
