import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RecommendedWidget extends StatelessWidget {
  const RecommendedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: SizedBox(
        width: 400,
        height: 40,
        child: Row(
          children: [
            Text(
              AppLocalizations.of(context)!.recommended,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              width: 8,
            ),
            Image.asset(
              'assets/images/logos/Information.png',
            )
          ],
        ),
      ),
    );
  }
}
