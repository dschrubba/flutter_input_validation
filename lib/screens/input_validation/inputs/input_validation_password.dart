import 'package:flutter/material.dart';
import 'package:flutter_input_validation/screens/input_validation/domain/input_validation_utils.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class InputValidationPassword extends StatefulWidget {
  static const String label = "Passwort";
  static const String hint = "*******";
  static const String error = "Ihr Passwort erfüllt nicht die Voraussetzungen";
  final GlobalKey<FormState> formKey;
  const InputValidationPassword({super.key, required this.formKey});

  @override
  State<InputValidationPassword> createState() =>
      _InputValidationPasswordState();
}

class _InputValidationPasswordState extends State<InputValidationPassword> {
  String? lastError;
  final _crtl = TextEditingController();
  FlutterPwValidator? passwordValidator;

  ///Passing a key to access the validate function
  final GlobalKey<FlutterPwValidatorState> _validatorKey =
      GlobalKey<FlutterPwValidatorState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onChanged: (value) {
            //lastError = fieldValidator(value);
            InputValidationUtils.validateForm(context, widget.formKey);
          },
          validator: (value) {
            return lastError;
          },
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          decoration: InputDecoration(
            filled: true,
            label: Text(InputValidationPassword.label),
            hintText: InputValidationPassword.hint,
            maintainHintSize: true,
            border: UnderlineInputBorder(),
            fillColor: Theme.of(context).canvasColor,
            errorText: lastError,
          ),
          controller: _crtl,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlutterPwValidator(
            key: _validatorKey,
            controller: _crtl,
            minLength: 6,
            uppercaseCharCount: 2,
            lowercaseCharCount: 2,
            numericCharCount: 3,
            specialCharCount: 1,
            width: 400,
            height: 180,
            onSuccess: () => {
              lastError = null,
              InputValidationUtils.validateForm(context, widget.formKey)
            },
            onFail: () => {
              lastError = InputValidationPassword.error
            },
          ),
        ),
      ],
    );
  }
}
