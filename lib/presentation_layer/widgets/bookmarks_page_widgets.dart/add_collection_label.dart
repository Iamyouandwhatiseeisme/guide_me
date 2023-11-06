import 'package:flutter/material.dart';
import 'package:guide_me/presentation_layer/widgets/text_with_underline_grey_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddCollectionLabel extends StatelessWidget {
  const AddCollectionLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextWithUnderLine(
        textToDisplay: AppLocalizations.of(context)!.addCollection,
        color: const Color(0xffF3F0E6),
      ),
    );
  }
}
