
import 'package:flutter/material.dart';
import 'package:flutter_input_validation/screens/input_validation/inputs/input_validation_email.dart';
import 'package:flutter_input_validation/screens/input_validation/inputs/input_validation_password.dart';
import 'package:flutter_input_validation/screens/input_validation/inputs/input_validation_submit.dart';
import 'package:flutter_input_validation/screens/input_validation/inputs/input_validation_username.dart';

class InputValidationScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  InputValidationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            InputValidationUsername(formKey: _formKey,),
            SizedBox(height: 16,),
            InputValidationEmail(formKey: _formKey,),
            SizedBox(height: 16,),
            InputValidationPassword(formKey: _formKey,),
            SizedBox(height: 32,),
            InputValidationSubmit(formKey: _formKey),
          ],
        ),
      ),
    );
  }

}