import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getLocalizedStringForDynamicBuilder(
    {required String textLabel, required AppLocalizations localization}) {
  switch (textLabel) {
    case "grocery":
      // return AppLocalizations.of(context)!.grocery;
      return localization.grocery;

    case "mall":
      return localization.mall;
    case "hospital":
      return localization.hospital;
    case "park":
      return localization.park;
    case "sights":
      return localization.sights;
    case "hotels":
      return localization.hotels;
    case "restaurants":
      return localization.restaurants;
    case "other":
      return localization.other;
    case "nightLife":
      return localization.nightLife;
    case "editName":
      return localization.editName;
    case "changePassword":
      return localization.changePassword;
    case "paymentsNCards":
      return localization.paymentsNCards;
    case "settings":
      return localization.settings;
  }
  return textLabel;
}
