import 'dart:async';

import 'package:guide_me/business_layer/cubits.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';

Future<void> createMap(
    String apiKey,
    double lat,
    double lon,
    Map<String, List<NearbyPlacesModel>> cachedData,
    String category,
    CategoryTypesFetcherCubit categoryTypesFetcherCubit,
    List<NearbyPlacesModel> listOfPlaces,
    Completer<String> mapLoaderController) async {
  if (!cachedData.containsKey(
    category,
  )) {
    categoryTypesFetcherCubit.fetchDataForCategories(
        listOfPlaces, apiKey, lat, lon, category);
    cachedData[category] = listOfPlaces;
  }
  if (cachedData[category]!.isNotEmpty) {
    mapLoaderController.complete('Completed');
  }
}