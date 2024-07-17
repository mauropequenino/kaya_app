import 'package:flutter/material.dart';
import 'package:kaya_app/features/home/view/widgets/filter_dialog_widget.dart';
import 'package:kaya_app/features/home/viewmodel/property_view_model.dart';
import 'package:kaya_app/features/property/view/pages/property_list_view.dart';
import 'package:provider/provider.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<PropertyViewModel>(context, listen: false).fetchProperties();
  }

  void _showFilterDialog(BuildContext context) {
    final viewModel = Provider.of<PropertyViewModel>(context, listen: false);
    showDialog(
        context: context,
        builder: (context) {
          return FilterDialogWidget(
              province: viewModel.province,
              type: viewModel.type,
              priceRange: viewModel.priceRange,
              onFilter: (String selectedProvince, String selectedType,
                  RangeValues priceRange) {
                viewModel.setFilters(
                    selectedProvince, selectedType, priceRange);
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SearchBar(
                      onTap: () {},
                      leading: const Icon(Icons.search),
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.tune),
                    onPressed: () => _showFilterDialog(context),
                  ),
                ],
              ),
              Consumer<PropertyViewModel>(
                builder: (context, viewModel, child) {
                  if (viewModel.properties.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return PropertyListView(
                        //properties: viewModel.filteredProperties
                        );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
