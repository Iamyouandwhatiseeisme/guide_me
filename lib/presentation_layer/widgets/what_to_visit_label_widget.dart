import 'package:flutter/widgets.dart';

class WhatToVisitLabelWidget extends StatelessWidget {
  const WhatToVisitLabelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            'What to visit',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.15,
                color: Color(0xff292F32)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Text('See all',
              style: TextStyle(
                  decorationColor: Color.fromARGB(75, 41, 47, 50),
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(75, 41, 47, 50))),
        )
      ],
    );
  }
}
