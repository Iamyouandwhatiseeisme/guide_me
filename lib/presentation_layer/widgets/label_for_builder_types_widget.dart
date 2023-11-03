// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

class LabelForBuilderTypesWidget extends StatelessWidget {
  final String textToDisplay;
  const LabelForBuilderTypesWidget({
    Key? key,
    required this.textToDisplay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            textToDisplay,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.15,
            ),
          ),
        ),
      ],
    );
  }
}
