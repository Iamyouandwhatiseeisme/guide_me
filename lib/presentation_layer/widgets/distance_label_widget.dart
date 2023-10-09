// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

class DistanceLabelWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final double fontSize;
  final Color color;
  final Color? iconColor;
  final double? distance;
  const DistanceLabelWidget({
    Key? key,
    this.width,
    this.height,
    required this.fontSize,
    required this.color,
    this.iconColor,
    required this.distance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Image.asset(
        "assets/images/Distance.png",
        width: width,
        height: height,
        color: iconColor,
      ),
      const SizedBox(
        width: 5,
      ),
      Text(
        "${distance.toString()} Km. away from you",
        style: TextStyle(
            fontSize: fontSize, fontWeight: FontWeight.w400, color: color),
      ),
    ]);
  }
}
