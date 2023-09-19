// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SignInWithButtonWIdget extends StatelessWidget {
  final String logo;
  final String label;
  final String heroTag;
  const SignInWithButtonWIdget({
    Key? key,
    required this.logo,
    required this.label,
    required this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 60,
      child: FloatingActionButton(
        heroTag: heroTag,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        backgroundColor: Color(0xffF3F0E6),
        foregroundColor: Color(0xff292F32),
        onPressed: () {},
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: Image.asset(logo),
            ),
            Text(
              'Continue with $label',
              style: TextStyle(
                  fontFamily: 'Telegraf',
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
