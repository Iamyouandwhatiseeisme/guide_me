import 'package:hive/hive.dart';

import 'package:guide_me/data_layer/models/nearby_places_model.dart';

import 'models/collection_model.dart';

void refreshItemList(String name, NearbyPlacesModel place) {
  final listToUpdate =
      Hive.box<CollectionModel>('CollectionLists').get(name)!.items;

  listToUpdate.remove(place);

  Hive.box<CollectionModel>('CollectionLists')
      .put(name, CollectionModel(name: name, items: listToUpdate));
}
