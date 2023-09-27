// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class LabelWIthCaregoryTypeNameAndSeeAllRow extends StatelessWidget {
  final String textToDisplay;
  const LabelWIthCaregoryTypeNameAndSeeAllRow({
    Key? key,
    required this.textToDisplay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      LabelForBuilderTypesWidget(
        textToDisplay: textToDisplay,
      ),
      const Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: Text('See all',
            style: TextStyle(
                decorationColor: Color.fromARGB(75, 41, 47, 50),
                decoration: TextDecoration.underline,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(75, 41, 47, 50))),
      )
    ]);
  }
}
