import 'package:guide_me/data_layer/data.dart';

import 'models/nearby_places_model.dart';

Future<bool> checkIfItemIsAdded(NearbyPlacesModel nearbyPlacesModel) async {
  final placeToAdd = nearbyPlacesModel;

  final box = Boxes.getNearbyPlaceModel();
  if (box.containsKey(placeToAdd)) {
    return true;
  } else {
    return false;
  }
}
