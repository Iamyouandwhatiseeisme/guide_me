import 'package:flutter/material.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class AddToCollectionsDialogTopTabWIthLabelIconAndExitButton
    extends StatelessWidget {
  const AddToCollectionsDialogTopTabWIthLabelIconAndExitButton({
    super.key,
    required this.iconToDisplay,
    required this.textLabel,
  });

  final Icon iconToDisplay;
  final String textLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconToDisplay,
          Text(
            textLabel,
            style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 24,
                color: Color(0xffF3F0E6)),
          ),
          const ExitDialogButton()
        ],
      ),
    );
  }
}
