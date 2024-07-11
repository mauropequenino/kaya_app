import 'package:flutter/material.dart';
import 'package:kaya_app/features/property/view/pages/property_item_details_page.dart';
import 'package:kaya_app/features/property/view/pages/property_item_page.dart';

class PropertyListView extends StatelessWidget {
  const PropertyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return PropertyItem(onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const PropertyItemDetailsPage(),
              ),
            );
          });
        },
      ),
    );
  }
}
