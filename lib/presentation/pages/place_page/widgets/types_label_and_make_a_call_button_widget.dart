import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';
import 'package:guide_me/presentation/pages/place_page/widgets/text_with_underline_grey_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../bloc/cubits.dart';
import 'type_label_widget.dart';

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
      TextButton(
          onTap: () {
            context.read<MakeACallCubit>().makePhoneCall(number!);
          },
          label: AppLocalizations.of(context)!.call)
    ]);
  }
}
