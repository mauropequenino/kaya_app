import 'package:flutter/material.dart';
import 'package:kaya_app/core/theme/app_pallete.dart';

class CustomFieldPhoneNumber extends StatelessWidget {
  final TextEditingController controller;

  const CustomFieldPhoneNumber({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Pallete.color1,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Número do telefone',
        prefixIcon: Container(
          height: 56,
          width: 75,
          alignment: Alignment.center,
          child: const Text(
            '+258',
            style: TextStyle(
              //fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
