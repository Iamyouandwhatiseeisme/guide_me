import 'package:flutter/widgets.dart';

class MapsPagePhotoWidget extends StatelessWidget {
  const MapsPagePhotoWidget({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
      width: 374,
      height: 180,
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
