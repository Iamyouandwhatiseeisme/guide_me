import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:guide_me/presentation_layer/widgets/text_with_underline_grey_widget.dart';

import '../../../business_layer/cubit/make_a_call_cubit.dart';
import '../type_label_widget.dart';

class TypesLabelAndMakeACallButtonWidgetRow extends StatelessWidget {
  const TypesLabelAndMakeACallButtonWidgetRow({
    super.key,
    required this.typesInString,
    required this.number,
  });

  final String typesInString;
  final String? number;

  @override
  Widget build(BuildContext context) {
    String formattedType = typesInString.replaceAll('_', ' ');
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      TypeLabelWidget(typesInString: formattedType),
      BlocBuilder<MakeACallCubit, bool>(
        builder: (context, callReview) {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
                onTap: () {
                  context.read<MakeACallCubit>().makePhoneCall(number!);
                },
                child: const TextWithUnderLine(textToDisplay: 'Call')),
          );
        },
      )
    ]);
  }
}
