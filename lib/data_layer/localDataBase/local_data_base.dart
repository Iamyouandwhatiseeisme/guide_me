import 'package:guide_me/data_layer/data.dart';
import 'package:guide_me/data_layer/models/collection_model.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';

import 'package:hive_flutter/hive_flutter.dart';

import '../models/opening_hours.dart';

class LocalDataBase {
  Future<void> initLocalDataBase() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NearbyPlacesModelAdapter());
    Hive.registerAdapter(OpeningHoursAdapter());
    Hive.registerAdapter(CollectionModelAdapter());
    await Hive.openBox<CollectionModel>('CollectionLists');
    await Hive.openBox<NearbyPlacesModel>('FavoritedPlaces');
    await requestWritePermission();
  }

  void refreshItemList(String name, NearbyPlacesModel place) {
    final listToUpdate =
        Hive.box<CollectionModel>('CollectionLists').get(name)!.items;

    listToUpdate.remove(place);

    Hive.box<CollectionModel>('CollectionLists')
        .put(name, CollectionModel(name: name, items: listToUpdate));
  }

  void toggleFavorites(
      NearbyPlacesModel item, Box<NearbyPlacesModel> box) async {
    if (box.containsKey(item.hashCode)) {
      await box.delete(item.hashCode);
    } else {
      await box.put(item.hashCode, item);
    }
  }
}
