import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:kaya_app/core/theme/app_pallete.dart';
import 'package:kaya_app/features/property/view/widgets/clip_widget.dart';
import 'package:kaya_app/features/property/view/widgets/image_slideshow_widget.dart';

class PropertyItemDetailsPage extends StatefulWidget {
  const PropertyItemDetailsPage({super.key});

  @override
  State<PropertyItemDetailsPage> createState() =>
      _PropertyItemDetailsPageState();
}

class _PropertyItemDetailsPageState extends State<PropertyItemDetailsPage> {
  final List<String> imageUrls = [
    'https://images.unsplash.com/photo-1460408037948-b89a5e837b41?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1493809842364-78817add7ffb?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?q=80&w=1560&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
  ];

  final List<String> facitilies = [
    'Facilidade 1',
    'Facilidade 2',
    'Facilidade 3',
    'Facilidade 4',
  ];

  final List<String> proximities = [
    'Proximidade 1',
    'Proximidade 2',
    'Proximidade 3',
    'Proximidade 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildSectionTitle('Imóvel'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSlideshowWidget(imageUrls: imageUrls),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Venda de Apartamento T2',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        _buildPrice('4.500.000')
                      ]),
                  const SizedBox(height: 10),
                  _buildInfoRowAddress(Icons.location_on, 'Maputo',
                      'Alto Maé A', 'Av. 25 De Julho'),
                  const SizedBox(height: 10),
                  _buildFeatures('1', '2', '75'),
                  const SizedBox(height: 20),
                  _buildSectionTitle('Descrição'),
                  const SizedBox(height: 10),
                  _buildDescription(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin posuere convallis mi vehicula ultrices. In vel dolor nec mauris rhoncus gravida. Praesent porta elit et imperdiet pharetra. In hac habitasse platea dictumst. Curabitur euismod erat nisl, non molestie libero sagittis at. Praesent condimentum, tortor nec convallis scelerisque, neque quam mollis nulla, quis fringilla nulla nisi posuere magna. Aenean tincidunt in purus et tristique.'),
                  const SizedBox(height: 20),
                  _buildSectionTitle('Facilidades'),
                  const SizedBox(height: 10),
                  ChipsWidget(items: facitilies),
                  const SizedBox(height: 20),
                  _buildSectionTitle('Proximidades'),
                  const SizedBox(height: 10),
                  ChipsWidget(items: proximities),
                  const SizedBox(height: 20),
                  const Divider(
                      height: 2,
                      thickness: 2,
                      color: Color.fromARGB(255, 167, 167, 167)),
                  const SizedBox(height: 10),
                  _buildPrice('4.500.000'),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        _buildOutlineButton(
                            'Agendar visita', Pallete.blackColor),
                        const SizedBox(width: 10),
                        _elevatedButton('Mensagem', Pallete.color1)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Text(text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
  }

  Widget _buildInfoRowAddress(
      IconData icon, String province, String city, String street) {
    String address = '$province - $city - $street';
    return Row(children: [
      Icon(icon, color: Pallete.color1, size: 20),
      const SizedBox(width: 5),
      Text(address, style: const TextStyle(color: Pallete.greyColor))
    ]);
  }

  Widget _buildDescription(String text) {
    return Text(text,
        style: const TextStyle(fontSize: 16, color: Pallete.greyColor));
  }

  Widget _buildPrice(String price) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: price,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const TextSpan(
              text: ' MT',
              style: TextStyle(
                color: Pallete.greyColor,
              )),
        ],
      ),
    );
  }

  Widget _buildFeatures(String bathrooms, String beds, String squareMeters) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      _buildFeature(Icons.bathtub, '$bathrooms Casas de banho'),
      const SizedBox(width: 10),
      _buildFeature(Icons.bed, '$beds Quartos'),
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

  Widget _buildOutlineButton(String titleString, Color colorButton) {
    return Expanded(
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.calendar_month, color: Colors.black),
        label: Text(titleString,
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 16, color: colorButton)),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          side: BorderSide(color: colorButton, width: 2),
        ),
      ),
    );
  }

  Widget _elevatedButton(String titleString, Color colorButton) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.message, color: Colors.white),
        label: Text(titleString,
            style: const TextStyle(
                color: Pallete.whiteColor,
                fontWeight: FontWeight.w700,
                fontSize: 16)),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          backgroundColor: colorButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }
}
