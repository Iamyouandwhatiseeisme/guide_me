import 'dart:async';

import 'package:guide_me/business_layer/cubits.dart';
import 'package:guide_me/data_layer/data.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';

Future<void> createList(
    Map<NearbyPlacesModel, double?> distanceMap,
    String apiKey,
    double lat,
    double lon,
    String category,
    CategoryTypesFetcherCubit categoryTypesFetcherCubit,
    List<NearbyPlacesModel> listOfPlaces,
    Completer<String> listLoaderController) async {
  if (listOfPlaces.isEmpty) {
    await categoryTypesFetcherCubit.fetchDataForCategories(
        listOfPlaces, apiKey, lat, lon, category);
    createDistanceMap(distanceMap, listOfPlaces, lat, lon);
    listLoaderController.complete('Completed');
  }
  if (listOfPlaces.isNotEmpty) {
    listLoaderController.complete('Completed');
    createDistanceMap(distanceMap, listOfPlaces, lat, lon);
  }
}
