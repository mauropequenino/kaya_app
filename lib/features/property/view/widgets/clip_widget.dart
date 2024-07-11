import 'package:flutter/material.dart';
import 'package:kaya_app/core/theme/app_pallete.dart';

class ChipsWidget extends StatelessWidget {
  final List<String> items;

  const ChipsWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: items.map((item) {
        return Chip(
          label: Text(item),
          shape: const StadiumBorder(
            side: BorderSide(color: Pallete.color1),
          ),
        );
      }).toList(),
    );
  }
}
