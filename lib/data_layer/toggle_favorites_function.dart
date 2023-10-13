import 'package:hive/hive.dart';

import 'models/nearby_places_model.dart';

void toggleFavorites(NearbyPlacesModel item, Box<NearbyPlacesModel> box) async {
  if (box.containsKey(item.hashCode)) {
    print('print: it\'s${item.isInBox} that item is in box');
    await box.delete(item.hashCode);
    print('print: ${item.name} removed from box');
  } else {
    print('print: it\'s${item.isInBox} that item is in box');
    await box.put(item.hashCode, item);

    print('print: ${item.name} added to box');
  }
}
