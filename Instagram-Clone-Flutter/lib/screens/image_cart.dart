import 'package:flutter/material.dart';
import 'package:practice_widgets/data/image_data.dart';

class ImageCart extends StatelessWidget {
  const ImageCart({super.key, required this.imageData});

  final ImageData imageData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: ClipRRect(
        child: Image.network(imageData.imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}
