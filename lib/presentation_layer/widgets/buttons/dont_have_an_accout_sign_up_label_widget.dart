import 'package:flutter/material.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class TextForSignUpOrSignIn extends StatefulWidget {
  const TextForSignUpOrSignIn({
    required this.onClick,
    super.key,
    required this.textToDisplay,
    required this.signUpOrSignIn,
  });
  final String textToDisplay;
  final String signUpOrSignIn;
  final VoidCallback onClick;

  @override
  State<TextForSignUpOrSignIn> createState() => _TextForSignUpOrSignInState();
}

class _TextForSignUpOrSignInState extends State<TextForSignUpOrSignIn> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
      width: 220,
      child: Row(
        children: [
          Text(
            widget.textToDisplay,
            style: const TextStyle(
                fontFamily: 'Telegraf',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xff292F32)),
          ),
          SignUpOrLogInText(
            onClick: widget.onClick,
            widget: widget,
            textToDisplay: widget.signUpOrSignIn,
          )
        ],
      ),
    );
  }
}
