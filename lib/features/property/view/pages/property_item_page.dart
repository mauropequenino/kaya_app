import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kaya_app/core/theme/app_pallete.dart';
import 'package:kaya_app/features/property/view/widgets/image_slideshow_widget.dart';

class PropertyItem extends StatelessWidget {
  final VoidCallback onTap;
  const PropertyItem({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ImageSlideshowWidget(),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Venda de Apartamento T2',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    _buildInfoRow(Icons.business_outlined, 'Apartamento'),
                    const SizedBox(height: 5),
                    _buildInfoRowAddress(
                        Icons.location_on, 'Mapauto', 'Alto Maé A'),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildPrice('4.500.000'),
                        _buildFeatures('1', '2', '75')
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(children: [
      Icon(icon, color: Pallete.color1, size: 20),
      const SizedBox(width: 5),
      Text(text, style: const TextStyle(color: Pallete.greyColor))
    ]);
  }

  Widget _buildInfoRowAddress(IconData icon, String province, String city) {
    String address = '$province - $city';
    return Row(children: [
      Icon(icon, color: Pallete.color1, size: 20),
      const SizedBox(width: 5),
      Text(address, style: const TextStyle(color: Pallete.greyColor))
    ]);
  }

  Widget _buildPrice(String price) {
    return Row(
      children: [
        const Icon(Icons.shopping_cart_rounded,
            color: Pallete.color1, size: 20),
        const SizedBox(width: 5),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: price,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const TextSpan(
                  text: ' MT',
                  style: TextStyle(
                    color: Pallete.greyColor,
                  )),
            ],
          ),
        ),
      ],
    );
  }

  //Qaurtos, casas de banho e metros quadrados
  Widget _buildFeatures(String bathrooms, String beds, String squareMeters) {
    return Row(children: [
      _buildFeature(Icons.bathtub, bathrooms),
      const SizedBox(width: 10),
      _buildFeature(Icons.bed, beds),
      const SizedBox(width: 10),
      _buildFeature(Icons.crop_free, '$squareMeters m²'),
    ]);
  }

  Widget _buildFeature(IconData icon, String text) {
    return Row(children: [
      Icon(icon, color: Pallete.color1, size: 20),
      const SizedBox(width: 3),
      Text(text, style: const TextStyle(color: Pallete.greyColor))
    ]);
  }
}