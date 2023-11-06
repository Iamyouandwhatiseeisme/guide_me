import 'package:flutter/material.dart';

import '../../../data_layer/models/language_model.dart';
import '../../../main.dart';

class LanguageDropDownMenuWidget extends StatelessWidget {
  const LanguageDropDownMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton<Language>(
            icon: const Icon(
              Icons.language,
            ),
            items: Language.languageList()
                .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                        value: e,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              e.flag,
                              style: const TextStyle(fontSize: 20),
                            ),
                            Text(
                              e.name,
                              style: const TextStyle(fontSize: 20),
                            )
                          ],
                        )))
                .toList(),
            onChanged: (Language? language) {
              if (language != null) {
                MyApp.setLocale(context, Locale(language.languageCode, ''));
              }
            }),
      ),
    );
  }
}
