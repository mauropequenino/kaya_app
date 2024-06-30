import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final String hintText;
  TextEditingController controller;
  DatePicker({super.key, required this.hintText, required this.controller});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Por favor, insira uma data válida";
        }
        return null;
      },
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(hintText: widget.hintText),
      controller: TextEditingController(),
      onTap: () async {
        // Prevents the keyboard from showing up
        FocusScope.of(context).requestFocus(new FocusNode());
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1950),
          lastDate: DateTime.now(),
        );
        var _selectedDate;
        if (pickedDate != null && pickedDate != _selectedDate) {
          setState(() {
            _selectedDate = pickedDate;
            widget.controller.text =
                DateFormat('dd/MM/yyyy').format(_selectedDate);
          });
        }
      },
    );
  }
}
