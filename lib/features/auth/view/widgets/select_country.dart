import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

class SelectCountry extends StatefulWidget {
  final TextEditingController controller;

  const SelectCountry({Key? key, required this.controller}) : super(key: key);

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return CSCPicker(
      showStates: false,
      showCities: false,
      flagState: CountryFlag.DISABLE,
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      disabledDropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.grey.shade300,
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      countrySearchPlaceholder: "Country",
      countryDropdownLabel: "*Nacionalidade",
      defaultCountry: CscCountry.Mozambique,
      disableCountry: true,
      selectedItemStyle: TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      dropdownHeadingStyle: TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
      dropdownItemStyle: TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      dropdownDialogRadius: 10.0,
      searchBarRadius: 10.0,
      onCountryChanged: (value) {
        setState(() {
          selectedCountry = value;
          widget.controller.text = selectedCountry ?? '';
        });
      },
    );
  }
}
