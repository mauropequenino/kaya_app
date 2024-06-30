import 'package:flutter/material.dart';

import 'package:kaya_app/core/theme/app_pallete.dart';
import 'package:kaya_app/core/widgets/custom_field.dart';
import 'package:kaya_app/features/auth/view/widgets/select_country.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _genreController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _nationalityController = TextEditingController();
  final _identicationNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Criar uma Conta",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Pallete.blackColor, fontWeight: FontWeight.bold, fontSize: 36),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Preencha os campos abaixo para ter acesso completo à aplicação",
                      style: TextStyle(color: Pallete.greyColor, fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    CustomField(hintText: 'Nome', controller: _firstNameController),
                    const SizedBox(height: 15), 
                    CustomField(hintText: 'Apelido', controller: _lastNameController),
                    const SizedBox(height: 15), 
                    SelectCountry(controller: _nationalityController,),
                    CustomField(hintText: 'Email', controller: _emailController),
                    const SizedBox(height: 15),
                    CustomField(hintText: 'Palavra-passe',controller: _passwordController, isObscureText: true),
                    const SizedBox(height: 15),
                  ]
                )
              )
            )
          )
        );
  }
}