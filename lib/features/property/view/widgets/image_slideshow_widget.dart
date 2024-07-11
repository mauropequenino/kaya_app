import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ImageSlideshowWidget extends StatelessWidget {
  final List<String> imageUrls;
  const ImageSlideshowWidget({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ImageSlideshow(
        indicatorColor: Colors.blue,
        onPageChanged: (value) {
          debugPrint('Page changed: $value');
        },
        autoPlayInterval: 0,
        isLoop: false,
        children: imageUrls.map((imageUrl) {
          return Image.network(imageUrl, height: 400, fit: BoxFit.cover);
        }).toList(),
      ),
    );
  }
}
