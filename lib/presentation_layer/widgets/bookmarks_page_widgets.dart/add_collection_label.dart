import 'package:flutter/material.dart';
import 'package:guide_me/presentation_layer/widgets/text_with_underline_grey_widget.dart';

class AddCollectionLabel extends StatelessWidget {
  const AddCollectionLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: TextWithUnderLine(
        textToDisplay: 'Add collection',
        color: Color(0xffF3F0E6),
      ),
    );
  }
}
