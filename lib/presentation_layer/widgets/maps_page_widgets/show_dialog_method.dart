import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../../../business_layer/cubit/favorites_button_cubit.dart';

void showDIalogWindow(
  BuildContext context,
  double screenHeight,
  double screenWidth,
  dynamic iconToDisplay,
  String textLabel,
  List<String>? listOfCategories,
  final double lat,
  final double lon,
  final String apiKey,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return listOfCategories == null
          ? buildDialogWithoutListOfCategories(
              lat,
              lon,
              apiKey,
              textLabel,
              screenHeight,
              screenWidth,
              iconToDisplay,
            )
          : buildDialogWithListOfCategories(
              lat,
              lon,
              apiKey,
              listOfCategories,
              textLabel,
              iconToDisplay,
              screenHeight,
              screenWidth,
            );
    },
  );
}

Widget buildDialogWithoutListOfCategories(
  double lat,
  double lon,
  String apiKey,
  String textLabel,
  double screenHeight,
  double screenWidth,
  dynamic iconToDisplay,
) {
  return ADialogWithoutListOfCategories(
    lat: lat,
    lon: lon,
    apiKey: apiKey,
    textLabel: textLabel,
    screenHeight: screenHeight,
    screenWidth: screenWidth,
    iconToDisplay: iconToDisplay,
  );
}

Widget buildDialogWithListOfCategories(
  double lat,
  double lon,
  String apiKey,
  List<String> listOfCategories,
  String textLabel,
  dynamic iconToDisplay,
  double screenHeight,
  double screenWidth,
) {
  return ADialogWithInterfaceListCategories(
    lat: lat,
    lon: lon,
    apiKey: apiKey,
    listOfCategories: listOfCategories,
    textLabel: textLabel,
    iconToDisplay: iconToDisplay,
    screenHeight: screenHeight,
    screenWidth: screenWidth, // Pass the FavoritesCubit
  );
}
