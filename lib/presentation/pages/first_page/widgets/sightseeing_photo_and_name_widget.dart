import 'package:flutter/widgets.dart';

class SIghtseeingPhotoAndNameWidget extends StatelessWidget {
  const SIghtseeingPhotoAndNameWidget({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
      height: 145,
      width: 240,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
