import 'package:flutter/material.dart';
import 'package:guide_me/presentation_layer/widgets/bookmarks_page_widgets.dart/build_dialog_for_collections_page.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../../../data_layer/models/nearby_places_model.dart';

void showDIalogWindow(
  final double? distance,
  String? image,
  BuildContext context,
  double screenHeight,
  double screenWidth,
  dynamic iconToDisplay,
  String textLabel,
  List<String>? listOfCategories,
  final double? lat,
  final double? lon,
  final String apiKey,
  final NearbyPlacesModel? plateToAdd,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return lat == null && lon == null
          ? buildADialogWindowForCollectionsPage(distance!, image!, apiKey,
              textLabel, screenHeight, screenWidth, iconToDisplay, plateToAdd!)
          : listOfCategories == null
              ? buildDialogWithoutListOfCategories(
                  lat!,
                  lon!,
                  apiKey,
                  textLabel,
                  screenHeight,
                  screenWidth,
                  iconToDisplay,
                )
              : buildDialogWithListOfCategories(
                  lat!,
                  lon!,
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

Widget buildADialogWindowForCollectionsPage(
  final double distance,
  String image,
  String apiKey,
  String textLabel,
  double screenHeight,
  double screenWidth,
  dynamic iconToDisplay,
  final NearbyPlacesModel plateToAdd,
) {
  return BuildDialogForCollectionsPage(
    distance: distance,
    image: image,
    apiKey: apiKey,
    textLabel: textLabel,
    screenHeight: screenHeight,
    screenWidth: screenWidth,
    iconToDisplay: iconToDisplay,
    placeToAdd: plateToAdd,
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
