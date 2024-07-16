import 'package:flutter/material.dart';

import 'package:kaya_app/core/theme/app_pallete.dart';
import 'package:kaya_app/core/widgets/custom_field.dart';
import 'package:kaya_app/core/widgets/dropdown_select.dart';
import 'package:kaya_app/features/auth/view/pages/success_page.dart';
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
  int _currentStep = 0;
  
  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  void _disposeControllers() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _genreController.dispose();
    _birthDateController.dispose();
    _nationalityController.dispose();
    _identificationDocTypeController.dispose();
    _identicationDocNumberController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  final List<String> _gender = [
    'Masculino',
    'Feminino',
  ];

  final List<String> _identificationDocType = [
    'Bilhete de Identidate',
    'Passporte',
  ];

  void _nextStep() {
    if (_currentStep < 1) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Registar",
                              style: TextStyle(
                                  color: Pallete.blackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Preencha os campos abaixo para criar uma conta.",
                              style: TextStyle(color: Pallete.greyColor),
                            ),
                            const SizedBox(height: 20),
                          ],
                        )),
                    Form(
                      key: _formKey,
                      child: Stepper(
                        currentStep: _currentStep,
                        onStepContinue: _nextStep,
                        onStepCancel: _previousStep,
                        controlsBuilder:
                            (BuildContext context, ControlsDetails controls) {
                          return Row(
                            children: [
                              if (_currentStep < 1)
                                Expanded(
                                    child: ElevatedButton(
                                  onPressed: controls.onStepContinue,
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 17),
                                      backgroundColor: Pallete.color1,
                                      foregroundColor: Pallete.whiteColor),
                                  child: const Text('Continuar'),
                                )),
                              if (_currentStep > 0)
                                Expanded(
                                    child: OutlinedButton(
                                  onPressed: controls.onStepCancel,
                                  style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 17),
                                      side:
                                          BorderSide(color: Pallete.blackColor),
                                      foregroundColor: Pallete.blackColor),
                                  child: const Text('Voltar'),
                                )),
                              if (_currentStep == 1)
                                Expanded(
                                  child: AuthButton(
                                    buttonText: 'Registar',
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SuccessPage()),
                                        );
                                      }
                                    },
                                  ),
                                )
                            ],
                          );
                        },
                        steps: [
                          Step(
                            title: const Text('Informações Pessoais'),
                            content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                      _identificationDocTypeController.text =
                                          value!;
                                    }),
                                  ),
                                  const SizedBox(height: 15),
                                  CustomField(
                                      hintText: 'Número do documento',
                                      controller:
                                          _identicationDocNumberController),
                                  const SizedBox(height: 25)
                                ]),
                            isActive: _currentStep >= 0,
                            state: _currentStep > 0
                                ? StepState.complete
                                : StepState.indexed,
                          ),
                          Step(
                            title: const Text("Informações de Contacto"),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomFieldPhoneNumber(
                                    controller: _phoneNumberController),
                                const SizedBox(height: 15),
                                CustomField(
                                    hintText: 'Email',
                                    controller: _emailController),
                                const SizedBox(height: 15),
                                CustomField(
                                    hintText: 'Palavra-passe',
                                    controller: _passwordController,
                                    isObscureText: true),
                                const SizedBox(height: 15),
                                const Text(
                                  "Ao criar uma conta você estará a concordar com os nossos termos e condições.",
                                  style: TextStyle(color: Pallete.greyColor),
                                ),
                                const SizedBox(height: 25),
                              ],
                            ),
                            isActive: _currentStep >= 1,
                            state: _currentStep > 1
                                ? StepState.complete
                                : StepState.indexed,
                          ),
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
