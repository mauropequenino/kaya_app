import 'package:flutter/material.dart';

class FilterDialogWidget extends StatefulWidget {
  final String province;
  final String type;
  final RangeValues priceRange;
  Function(String province, String type, RangeValues priceRange) onFilter;

  FilterDialogWidget(
      {super.key,
      required this.province,
      required this.type,
      required this.priceRange,
      required this.onFilter});

  @override
  State<FilterDialogWidget> createState() => _FilterDialogWidgetState();
}

class _FilterDialogWidgetState extends State<FilterDialogWidget> {
  late String selectedProvince;
  late String selectedType;
  late RangeValues priceRange;
  final List<String> provinces = [
    'Todas',
    'Maputo',
    'Gaza',
    'Inhambane',
    'Sofala',
    'Manica',
    'Tete',
    'Zambézia',
    'Nampula',
    'Niassa',
    'Cabo Delgado'
  ];
  final List<String> propertyTypes = [
    'Todos',
    'Apartamento',
    'Geminada',
    'Vivenda',
    'Moradia',
    'Quinta'
  ];

  @override
  void initState() {
    super.initState();
    selectedProvince = widget.province;
    selectedType = widget.type;
    priceRange = widget.priceRange;

    // Ensure the initial price range values are within bounds
    if (priceRange.start < 0) {
      priceRange = RangeValues(0, priceRange.end);
    }
    if (priceRange.end > 1000000) {
      priceRange = RangeValues(priceRange.start, 1000000);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Filter Properties'),
      content: SingleChildScrollView(
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              value: selectedProvince,
              items: provinces
                  .map((province) => DropdownMenuItem(
                        value: province,
                        child: Text(province),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedProvince = value!;
                });
              },
              decoration: const InputDecoration(labelText: 'Provincia'),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: propertyTypes.map((type) {
                return ChoiceChip(
                  label: Text(type),
                  selected: selectedType == type,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedType = selected ? type : 'Todos';
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            RangeSlider(
              values: priceRange,
              min: 0,
              max: 1000000,
              divisions: 100,
              labels: RangeLabels(
                priceRange.start.round().toString(),
                priceRange.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  priceRange = values;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Min: ${priceRange.start.round()}'),
                Text('Max: ${priceRange.end.round()}'),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onFilter(selectedProvince, selectedType, priceRange);
            Navigator.of(context).pop();
          },
          child: const Text('Apply Filters'),
        ),
      ],
    );
  }
}
