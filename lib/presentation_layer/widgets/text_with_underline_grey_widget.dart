import 'package:flutter/widgets.dart';

class TextWithUnderLine extends StatelessWidget {
  final String textToDisplay;
  const TextWithUnderLine({
    Key? key,
    required this.textToDisplay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textToDisplay,
      style: TextStyle(
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Color(0xff292F32).withOpacity(0.75)),
    );
  }
}
