import 'package:flutter/material.dart';

class ImageForCardOnCollectionsListDialogPage extends StatelessWidget {
  const ImageForCardOnCollectionsListDialogPage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
      width: 180,
      height: 133,
      child: ClipRect(
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
