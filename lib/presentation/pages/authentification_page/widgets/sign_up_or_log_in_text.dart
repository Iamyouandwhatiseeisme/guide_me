import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

class ClickableRichText extends StatelessWidget {
  const ClickableRichText({
    super.key,
    required this.onClick,
    this.widget,
    required this.textToDisplay,
  });
  final VoidCallback onClick;
  final String textToDisplay;
  final TextForSignUpOrSignIn? widget;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      recognizer: TapGestureRecognizer()..onTap = onClick,
      text: textToDisplay,
      style: const TextStyle(
          decoration: TextDecoration.underline,
          fontFamily: 'Telegraf',
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Color(0xff292F32)),
    ));
  }
}
