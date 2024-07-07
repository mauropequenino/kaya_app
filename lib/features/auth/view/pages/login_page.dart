import 'package:flutter/material.dart';
import 'package:kaya_app/core/theme/app_pallete.dart';
import 'package:kaya_app/core/widgets/custom_field.dart';
import 'package:kaya_app/features/auth/view/pages/forget_passowrd_page.dart';
import 'package:kaya_app/features/auth/view/pages/register_page.dart';
import 'package:kaya_app/features/auth/view/widgets/auth_button.dart';
import 'package:kaya_app/features/home/view/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  //bool _passwordVisivel = false;
  //bool _passwordConfirmVisivel = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1605125354450-9bc69f892817?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTg0fHxidWlsZGluZ3xlbnwwfHwwfHx8MA%3D%3D'),
                  fit: BoxFit.fill)),
          child: SizedBox.expand(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 70),
                  const Text(
                    'Kaya.',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 36),
                  ),
                  const SizedBox(height: 60),
                  Form(
                      key: _formKey,
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomField(
                              hintText: 'Email', controller: _emailController),
                          const SizedBox(height: 15),
                          CustomField(
                              hintText: 'Palavra-passe',
                              controller: _passwordController,
                              isObscureText: true),
                          const SizedBox(height: 15),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgetPassowrdPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Esqueceu a sua palavra-passe?',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 2,
                                      decorationColor: Colors.white),
                                ),
                              )),
                          const SizedBox(height: 25),
                          Row(
                            children: [
                              Expanded(
                                child: AuthButton(
                                    buttonText: 'Entrar', onTap: () {}),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const RegisterPage(),
                                ),
                              );
                            },
                            child: RichText(
                              text: const TextSpan(
                                text: 'Ainda não tem uma conta? ',
                                style: TextStyle(
                                    color: Pallete.whiteColor, fontSize: 16),
                                children: [
                                  TextSpan(
                                    text: 'Registar',
                                    style: TextStyle(
                                      color: Pallete.color1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Registar mais tarde',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2,
                                  decorationColor: Colors.white),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          )),
    );
  }
}
