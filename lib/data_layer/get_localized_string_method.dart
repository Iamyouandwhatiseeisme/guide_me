import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getLocalizedString(String textLabel, BuildContext context) {
  switch (textLabel) {
    case "grocery":
      return AppLocalizations.of(context)!.grocery;
    case "mall":
      return AppLocalizations.of(context)!.mall;
    case "hospital":
      return AppLocalizations.of(context)!.hospital;
    case "park":
      return AppLocalizations.of(context)!.park;
    case "sights":
      return AppLocalizations.of(context)!.sights;
    case "hotels":
      return AppLocalizations.of(context)!.hotels;
    case "restaurants":
      return AppLocalizations.of(context)!.restaurants;
    case "other":
      return AppLocalizations.of(context)!.other;
    case "nightLife":
      return AppLocalizations.of(context)!.nightLife;
  }
  return textLabel;
}
