import 'dart:async';

import 'package:guide_me/business_layer/cubits.dart';
import 'package:guide_me/data_layer/data.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';

import '../main.dart';
import 'httpClients/google_api_client.dart';

Future<void> createList(
    Map<NearbyPlacesModel, double?> distanceMap,
    String category,
    CategoryTypesFetcherCubit categoryTypesFetcherCubit,
    List<NearbyPlacesModel> listOfPlaces,
    Completer<String> listLoaderController) async {
  if (listOfPlaces.isEmpty) {
    await categoryTypesFetcherCubit.fetchDataForCategories(
        listOfPlaces, category, sl.sl<GoogleApiClient>());
    createDistanceMap(
      distanceMap,
      listOfPlaces,
    );
    listLoaderController.complete('Completed');
  }
  if (listOfPlaces.isNotEmpty) {
    listLoaderController.complete('Completed');
    createDistanceMap(
      distanceMap,
      listOfPlaces,
    );
  }
}
