import 'package:flutter/material.dart';
import 'package:flutter_input_validation/screens/input_validation/domain/input_validation_utils.dart';

class InputValidationSubmit extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const InputValidationSubmit({super.key, required this.formKey});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () => {
      InputValidationUtils.validateForm(context, formKey, isFormSubmit: true)
    }, child: Text("Absenden"));
  }
}