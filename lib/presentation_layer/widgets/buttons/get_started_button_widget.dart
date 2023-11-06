import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffC75E6B),
            fixedSize: const Size(320, 60)),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('authPage');
        },
        child: Text(
          AppLocalizations.of(context)!.getStartedButtonText,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
