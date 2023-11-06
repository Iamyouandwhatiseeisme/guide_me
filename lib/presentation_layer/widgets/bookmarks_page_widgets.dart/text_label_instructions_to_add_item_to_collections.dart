import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TextLabelInstructionsToAddItemToCollections extends StatelessWidget {
  const TextLabelInstructionsToAddItemToCollections({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      AppLocalizations.of(context)!.pressAndHold,
      style: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff292F32)),
    ));
  }
}
