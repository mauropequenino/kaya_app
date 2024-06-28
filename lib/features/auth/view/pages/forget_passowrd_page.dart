import 'package:flutter/material.dart';
import 'package:kaya_app/core/theme/app_pallete.dart';
import 'package:kaya_app/core/widgets/custom_field.dart';
import 'package:kaya_app/features/auth/view/widgets/auth_button.dart';

class ForgetPassowrdPage extends StatefulWidget {
  const ForgetPassowrdPage({super.key});

  @override
  State<ForgetPassowrdPage> createState() => _ForgetPassowrdPageState();
}

class _ForgetPassowrdPageState extends State<ForgetPassowrdPage> {
  var _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: [
            const Icon(
              Icons.lock_outline, 
              size: 100.0, 
              color: Pallete.color1, 
            ),
            const Text(
              'Redefina a sua palavra-passe',
              textAlign: TextAlign.center,
              style: TextStyle(color: Pallete.color1, fontWeight: FontWeight.bold, fontSize: 28),
            ),
            const Text(
              'Insira seu endereço de e-mail e um link será enviado para redefinir sua palavra-passe.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            const SizedBox(height: 40),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  CustomField(hintText: 'Email', controller: _emailController),
                  const SizedBox(height: 20),
                  AuthButton(buttonText: 'Enviar', onTap: () {}),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                       
                      },
                      child: const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: 'Ainda não tem uma conta?', style: TextStyle(color: Colors.black, fontSize: 16)),
                            TextSpan(
                              text: ' Registar',
                              style: TextStyle(color: Pallete.color1, fontSize: 16, fontWeight: FontWeight.bold)
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ]
              )
            ),
          ],
        ),
      ),
    );
  }
}