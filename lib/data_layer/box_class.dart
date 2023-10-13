import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<NearbyPlacesModel> getNearbyPlaceModel() =>
      Hive.box<NearbyPlacesModel>('FavoritedPlaces');
}
