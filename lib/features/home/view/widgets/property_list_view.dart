import 'package:flutter/material.dart';
import 'package:kaya_app/features/home/view/pages/property_item_view_page.dart';
import 'package:kaya_app/features/home/view/widgets/property_item_details.dart';

class PropertyListView extends StatelessWidget {
  const PropertyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return PropertyItemDetails(onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const PropertyItemViewPage(),
              ),
            );
          });
        },
      ),
    );
  }
}
