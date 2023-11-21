import 'package:flutter/material.dart';
import 'package:guide_me/data_layer/constants/language_constants.dart';

import '../../../../data_layer/models/language_model.dart';
import '../../../../main.dart';

class LanguageDropDownMenuWidget extends StatefulWidget {
  const LanguageDropDownMenuWidget({
    super.key,
  });

  @override
  State<LanguageDropDownMenuWidget> createState() =>
      _LanguageDropDownMenuWidgetState();
}

class _LanguageDropDownMenuWidgetState
    extends State<LanguageDropDownMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
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
              onChanged: (Language? language) async {
                if (language != null) {
                  Locale locale = await setLocale(language.languageCode);

                  if (mounted) {
                    MyApp.setLocale(context, locale);
                  }
                }
              }),
        ),
      );
    });
  }
}
