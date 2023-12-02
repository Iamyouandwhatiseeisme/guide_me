import 'package:flutter/material.dart';
import 'package:guide_me/data/constants/language_constants.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

import '../../../widgets/navigation/navigator_client.dart';

class TextForSignUpOrSignIn extends StatefulWidget {
  const TextForSignUpOrSignIn({
    super.key,
    required this.shouldSignUp,
    required this.textToDisplay,
    required this.signUpOrSignIn,
  });
  final String textToDisplay;
  final String signUpOrSignIn;
  final bool shouldSignUp;

  @override
  State<TextForSignUpOrSignIn> createState() => _TextForSignUpOrSignInState();
}

class _TextForSignUpOrSignInState extends State<TextForSignUpOrSignIn> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 260,
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
          const SizedBox(
            width: 5,
          ),
          ClickableRichText(
            onClick: widget.shouldSignUp
                ? () => Navigator.pushReplacementNamed(
                    context, NavigatorClient.signUpPage)
                : () => Navigator.pushReplacementNamed(
                    context, NavigatorClient.loginPage),
            widget: widget,
            textToDisplay: widget.signUpOrSignIn,
          )
        ],
      ),
    );
  }
}
