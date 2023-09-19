import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 174,
          height: 1,
          child: Divider(
            indent: 20,
            endIndent: 13,
            thickness: 1,
            color: Color(0xff292F32).withOpacity(0.75),
          ),
        ),
        Text('Or'),
        Container(
          width: 174,
          height: 1,
          child: Divider(
            indent: 13,
            endIndent: 20,
            thickness: 1,
            color: Color(0xff292F32).withOpacity(0.75),
          ),
        ),
      ],
    );
  }
}
