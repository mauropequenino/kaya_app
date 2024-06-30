import 'package:flutter/material.dart';

import 'package:kaya_app/core/theme/app_pallete.dart';
import 'package:kaya_app/core/widgets/custom_field.dart';
import 'package:kaya_app/core/widgets/dropdown_select.dart';
import 'package:kaya_app/features/auth/view/widgets/auth_button.dart';
import 'package:kaya_app/features/auth/view/widgets/custom_filed_phonenumber.dart';
import 'package:kaya_app/features/auth/view/widgets/date_picker.dart';

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
  final _identificationDocTypeController = TextEditingController();
  final _identicationDocNumberController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  List<String> _gender = [
    'Feminino',
    'Masculino',
  ];

  List<String> _identificationDocType = [
    'Bilhete de Identidate',
    'Passporte',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Registar",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Pallete.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 36),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Preencha os campos abaixo para criar uma conta.",
                            style: TextStyle(
                                color: Pallete.greyColor, fontSize: 18),
                          ),
                          const SizedBox(height: 20),
                          CustomField(
                              hintText: 'Nome',
                              controller: _firstNameController),
                          const SizedBox(height: 15),
                          CustomField(
                              hintText: 'Apelido',
                              controller: _lastNameController),
                          const SizedBox(height: 15),
                          DropdownSelect(
                            typeValue: 'Genero',
                            values: _gender,
                            selectedValue: _genreController.text,
                            onChanged: (value) => setState(() {
                              _genreController.text = value!;
                            }),
                          ),
                          const SizedBox(height: 15),
                          DatePicker(
                              hintText: 'Data de Nascimento',
                              controller: _birthDateController),
                          const SizedBox(height: 15),
                          CustomField(
                              hintText: 'Nacionalidade',
                              controller: _nationalityController),
                          const SizedBox(height: 15),
                          DropdownSelect(
                            typeValue: 'Documento de identidade',
                            values: _identificationDocType,
                            selectedValue:
                                _identificationDocTypeController.text,
                            onChanged: (value) => setState(() {
                              _identificationDocTypeController.text = value!;
                            }),
                          ),
                          const SizedBox(height: 15),
                          CustomField(
                              hintText: 'Número do documento',
                              controller: _identicationDocNumberController),
                          const SizedBox(height: 15),
                          CustomFieldPhoneNumber(
                              controller: _phoneNumberController),
                          const SizedBox(height: 15),
                          CustomField(
                              hintText: 'Email', controller: _emailController),
                          const SizedBox(height: 15),
                          CustomField(
                              hintText: 'Palavra-passe',
                              controller: _passwordController,
                              isObscureText: true),
                          const SizedBox(height: 25),
                          AuthButton(buttonText: 'Registar', onTap: () {}),
                        ])))));
  }
}
