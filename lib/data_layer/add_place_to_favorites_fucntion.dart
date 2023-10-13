import 'package:hive_flutter/hive_flutter.dart';

import 'models/nearby_places_model.dart';

Future<void> addPlaceToFavorites(
    NearbyPlacesModel nearbyPlacesModel, Box<NearbyPlacesModel> box) async {
  final placeToAdd = nearbyPlacesModel;

  await box.add(placeToAdd);
}

Future<void> removePlaceFromFavorites(
    NearbyPlacesModel nearbyPlacesModel) async {
  final placeToAdd = nearbyPlacesModel;

  await placeToAdd.delete();
}
