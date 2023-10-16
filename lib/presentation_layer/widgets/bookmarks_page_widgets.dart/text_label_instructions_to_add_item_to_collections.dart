import 'package:flutter/material.dart';

class TextLabelInstructionsToAddItemToCollections extends StatelessWidget {
  const TextLabelInstructionsToAddItemToCollections({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'Press and hold item to add to collection',
      style: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff292F32)),
    ));
  }
}
