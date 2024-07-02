import 'package:flutter/material.dart';
import 'package:kaya_app/core/theme/app_pallete.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  const AuthButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 17),
          backgroundColor: Pallete.color1,
          foregroundColor: Pallete.whiteColor
          //minimumSize: const Size.fromHeight(50)
          ),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
