import 'package:flutter/material.dart';
import 'package:kaya_app/core/theme/app_pallete.dart';

class FilterDialogWidget extends StatefulWidget {
  final String province;
  final String type;
  final int minPrice;
  final int maxPrice;
  final Function(String province, String type, int minPrice, int maxPrice)
      onFilter;

  FilterDialogWidget(
      {super.key,
      required this.province,
      required this.type,
      required this.minPrice,
      required this.maxPrice,
      required this.onFilter});

  @override
  State<FilterDialogWidget> createState() => _FilterDialogWidgetState();
}

class _FilterDialogWidgetState extends State<FilterDialogWidget> {
  late String selectedProvince;
  late String selectedType;
  late TextEditingController minPriceController;
  late TextEditingController maxPriceController;

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
    minPriceController =
        TextEditingController(text: widget.minPrice.toString());
    maxPriceController =
        TextEditingController(text: widget.maxPrice.toString());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Filtrar Imóveis',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Pallete.whiteColor,
      content: SingleChildScrollView(
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            _buildSectionTitle("Provincia"),
            const SizedBox(height: 10),
            _buildDropdownButtonFormField(provinces),
            const SizedBox(height: 15),
            _buildSectionTitle("Tipo"),
            const SizedBox(height: 10),
            _buildChoiceClip(propertyTypes),
            const SizedBox(height: 15),
            _buildSectionTitle("Preço"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconTextFrom(const Icon(Icons.price_change), 'Preço min',
                    minPriceController),
                const SizedBox(width: 10),
                _buildIconTextFrom(const Icon(Icons.price_change), 'Preço máx',
                    maxPriceController),
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
        _buildElevatedButton('Aplicar Filtro')
      ],
    );
  }

  Widget _buildSectionTitle(String text) {
    return Text(text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
  }

  Widget _buildChoiceClip(List<String> propertyTypes) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: propertyTypes.map((item) {
        return ChoiceChip(
            label: Text(item),
            backgroundColor: Pallete.whiteColor,
            selected: selectedType == item,
            onSelected: (bool selected) {
              setState(() {
                selectedType = selected ? item : 'Todos';
              });
            },
            shape: const StadiumBorder(
              side: BorderSide(color: Pallete.color1),
            ));
      }).toList(),
    );
  }

  Widget _buildDropdownButtonFormField(List<String> provinces) {
    return DropdownButtonFormField<String>(
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
    );
  }

  Widget _buildElevatedButton(String titleString) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          final minPrice = int.tryParse(minPriceController.text) ?? 0;
          final maxPrince = int.tryParse(maxPriceController.text) ?? 100000000;
          widget.onFilter(selectedProvince, selectedType, minPrice, maxPrince);
          Navigator.of(context).pop();
        },
        style: TextButton.styleFrom(
          foregroundColor: Pallete.whiteColor,
          backgroundColor: Pallete.color1,
        ),
        child: Text(titleString),
      ),
    );
  }

  Widget _buildIconTextFrom(
      Icon icon, String hintText, TextEditingController controller) {
    return Expanded(
        child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(hintText: hintText, prefixIcon: icon),
    ));
  }
}
