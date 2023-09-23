import 'package:flutter/material.dart';
import 'package:guide_me/presentation_layer/widgets/star_icon_widget.dart';

class StarRating extends StatelessWidget {
  final num rating;

  StarRating({required this.rating});

  @override
  Widget build(BuildContext context) {
    final int filledStars = rating.floor();
    final bool hasHalfStar = (rating - filledStars) >= 0.5;

    return Row(
      children: List.generate(5, (index) {
        if (index < filledStars) {
          return StarIcon(isFilled: true);
        } else if (index == filledStars && hasHalfStar) {
          return Icon(
            Icons.star_half_outlined,
            color: Colors.red,
            size: 12,
          ); // Add a half star
        } else {
          return StarIcon(isFilled: false);
        }
      }),
    );
  }
}
