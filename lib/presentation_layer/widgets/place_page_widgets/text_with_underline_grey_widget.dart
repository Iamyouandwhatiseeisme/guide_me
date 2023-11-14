import 'package:flutter/widgets.dart';

class TextWithUnderLine extends StatelessWidget {
  final Color color;
  final String textToDisplay;
  const TextWithUnderLine({
    Key? key,
    required this.color,
    required this.textToDisplay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textToDisplay,
      style: TextStyle(
          decorationColor: color,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: color),
    );
  }
}
