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
}
