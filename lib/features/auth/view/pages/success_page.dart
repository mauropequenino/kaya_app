// success_screen.dart
import 'package:flutter/material.dart';
import 'package:kaya_app/core/theme/app_pallete.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Pallete.color1,
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Registado sucesso!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the home or initial screen
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 17),
                  backgroundColor: Pallete.color1,
                  foregroundColor: Pallete.whiteColor,
                  minimumSize: const Size(200, 50)),
              child: const Text('Ir a página inicial'),
            ),
          ],
        ),
      ),
    );
  }
}
