import 'package:flutter/material.dart';
import 'package:guide_me/presentation_layer/pages/pages.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffC75E6B), fixedSize: Size(320, 60)),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('authPage');
        },
        child: Text(
          'Get Started',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
