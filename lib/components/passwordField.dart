import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import 'constants.dart';

class PasswordTextField extends StatefulWidget {
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  String? _labelText;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextFormField(
          obscureText: true,
          obscuringCharacter: '*',
          style: kTextFormFieldStyle,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding:
                new EdgeInsets.only(top: 60.0, left: 10.0, right: 10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            labelText: _labelText,
            hintText: 'Password',
            hintStyle: kHintStyle,
            labelStyle: kLabelStyle,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              borderSide: BorderSide(
                color: Colors.grey[200]!,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              borderSide: BorderSide(
                color: Colors.grey.shade200,
                width: 2.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            )),
          ),
          onChanged: (v) {
            setState(() {
              if (v.isNotEmpty) {
                _labelText = 'Password';
              } else {
                _labelText = null;
              }
            });
          },
          validator: Validators.compose([
            Validators.required('Password is required'),
            Validators.minLength(10, 'Name cannot be less than 10 characters'),
            Validators.maxLength(
                15, 'Name cannot be greater than 15 characters'),
            Validators.patternString(r'^(?=.*?[A-Z]).{8,}$',
                'Include at least 1 uppercase character'),
            Validators.patternString(
                r'^(?=.*?[0-9]).{8,}$', 'Include at least 1 number'),
            Validators.patternString(r'^(?=.*?[!@#\$&*~]).{8,}$',
                'Include at least 1 special character')
          ]),
        ),
      ),
    );
  }
}
