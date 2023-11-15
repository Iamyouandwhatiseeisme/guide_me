import 'dart:async';

import 'package:guide_me/business_layer/cubits.dart';
import 'package:guide_me/data_layer/httpClients/google_api_client.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/main.dart';

Future<void> createMap(
    Map<String, List<NearbyPlacesModel>> cachedData,
    String category,
    CategoryTypesFetcherCubit categoryTypesFetcherCubit,
    List<NearbyPlacesModel> listOfPlaces,
    Completer<String> mapLoaderController) async {
  if (!cachedData.containsKey(
    category,
  )) {
    categoryTypesFetcherCubit.fetchDataForCategories(
        listOfPlaces, category, sl.sl<GoogleApiClient>());
    cachedData[category] = listOfPlaces;
  }
  if (cachedData[category]!.isNotEmpty) {
    mapLoaderController.complete('Completed');
  }
}
