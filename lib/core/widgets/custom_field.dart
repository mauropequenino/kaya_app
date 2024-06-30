import 'package:flutter/material.dart';
import 'package:kaya_app/core/theme/app_pallete.dart';

class CustomField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;
  const CustomField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.isObscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      obscureText: isObscureText,
      validator: (val) {
        if (val!.trim().isEmpty) {
          return "´É obrigatório preencher este campo!";
        }
        return null;
      },
    );
  }
}
