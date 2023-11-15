import 'package:flutter/material.dart';

class TranzitioningLogo extends StatelessWidget {
  const TranzitioningLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/images/logos/GuideMe (1) 2.png',
        height: 159.3,
        width: 200,
      ),
    );
  }
}
