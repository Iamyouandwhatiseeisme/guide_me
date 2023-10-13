import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/data_layer/add_place_to_favorites_fucntion.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:hive/hive.dart';

class FavoritesButtonCubit extends Cubit<Box<NearbyPlacesModel>> {
  FavoritesButtonCubit()
      : super(Hive.box<NearbyPlacesModel>('FavoritedPlaces'));

  void toggleFavorites(NearbyPlacesModel item) async {
    if (item.isInBox) {
      await removePlaceFromFavorites(item);
    } else {
      // await addPlaceToFavorites(item);
    }
    final listOfFavorites = Hive.box<NearbyPlacesModel>('FavoritedPlaces');
    emit(listOfFavorites);
  }

  // Method to add an item to favorites
  void addToFavorites(
    NearbyPlacesModel item,
  ) {
    // addPlaceToFavorites(item);
    print('print: item added');
    final listOfFavorites = Hive.box<NearbyPlacesModel>('FavoritedPlaces');
    emit(listOfFavorites);
  }

  // Method to remove an item from favorites
  void removeFromFavorites(NearbyPlacesModel item) {
    removePlaceFromFavorites(item);
    print('print: item removed');
    final listOfFavorites = Hive.box<NearbyPlacesModel>('FavoritedPlaces');
    emit(listOfFavorites);
  }

  // Method to check if an item is in favorites
  bool isFavorite(NearbyPlacesModel item) {
    final listOfFavorites = Hive.box<NearbyPlacesModel>('FavoritedPlaces');
    bool isInbox = item.isInBox;
    print('print: $isInbox');
    emit(listOfFavorites);
    return (isInbox);
  }
}
