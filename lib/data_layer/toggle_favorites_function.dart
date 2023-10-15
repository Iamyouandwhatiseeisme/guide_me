import 'package:hive/hive.dart';

import 'models/nearby_places_model.dart';

void toggleFavorites(NearbyPlacesModel item, Box<NearbyPlacesModel> box) async {
  if (box.containsKey(item.hashCode)) {
    await box.delete(item.hashCode);
  } else {
    await box.put(item.hashCode, item);
  }
}
