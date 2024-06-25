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
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
        ),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 17),
            backgroundColor: Pallete.color1,
            foregroundColor: Pallete.whiteColor
          ),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
