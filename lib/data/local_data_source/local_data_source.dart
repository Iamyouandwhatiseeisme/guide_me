import 'package:guide_me/data/data.dart';

import 'package:hive_flutter/hive_flutter.dart';

class LocalDataSource {
  Future<void> initLocalDataBase() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NearbyPlacesModelAdapter());
    Hive.registerAdapter(OpeningHoursAdapter());
    Hive.registerAdapter(CollectionModelAdapter());
    await Hive.openBox<CollectionModel>('CollectionLists');
    await Hive.openBox<NearbyPlacesModel>('FavoritedPlaces');
    await requestWritePermission();
  }

  void refreshItemList(
      {required String name, required NearbyPlacesModel place}) {
    final listToUpdate =
        Hive.box<CollectionModel>('CollectionLists').get(name)!.items;

    listToUpdate.remove(place);

    Hive.box<CollectionModel>('CollectionLists')
        .put(name, CollectionModel(name: name, items: listToUpdate));
  }

  void toggleFavorites(
      {required NearbyPlacesModel item,
      required Box<NearbyPlacesModel> box}) async {
    if (box.containsKey(item.hashCode)) {
      await box.delete(item.hashCode);
    } else {
      await box.put(item.hashCode, item);
    }
  }

  void addToCollection({
    required String nameOfCollection,
    required List<NearbyPlacesModel> listToCreate,
  }) {
    Hive.box<CollectionModel>("CollectionLists").put(
      nameOfCollection,
      CollectionModel(name: nameOfCollection, items: listToCreate),
    );
  }

  // void deleteItem(
  //     {required NearbyPlacesModel place,
  //     required List<NearbyPlacesModel> listOfFavorites,
  //     required Box<NearbyPlacesModel> box,
  //     required Function refreshList}) {
  //   Hive.box<NearbyPlacesModel>('FavoritedPlaces').delete(place.hashCode);
  //   listOfFavorites.clear();
  //   listOfFavorites = box.toMap().values.toList();

  //   refreshList();
  // }
}
