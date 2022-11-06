import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {

  final TextInputType keyboardType;
  final Icon icon;
  final bool obscureText;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  const AuthTextField({Key? key,
    required this.hintText,
    required this.keyboardType,
    this.obscureText = false,
    required this.icon,
    required this.validator, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        keyboardType:keyboardType,
        obscureText: obscureText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          icon: icon,
          hintText: hintText,
        ),
        controller: controller,
        validator: validator,
      ),
    );
  }
}
