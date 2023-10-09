import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';

class FavoritesCubit extends Cubit<List<FavoriteItem>> {
  FavoritesCubit() : super([]);

  // Method to add an item to favorites
  void addToFavorites(NearbyPlacesModel item, double? distance) {
    final updatedFavorites = [...state];
    updatedFavorites.add(FavoriteItem(item, distance));
    emit(updatedFavorites);
  }

  // Method to remove an item from favorites
  void removeFromFavorites(NearbyPlacesModel item) {
    final updatedFavorites = [...state];
    updatedFavorites.removeWhere((favItem) => favItem.item == item);
    emit(updatedFavorites);
  }

  // Method to check if an item is in favorites
  bool isFavorite(NearbyPlacesModel item) {
    return state.any((favItem) => favItem.item == item);
  }
}

// Class to represent a favorite item with an associated distance
class FavoriteItem {
  final NearbyPlacesModel item;
  final double? distance;

  FavoriteItem(this.item, this.distance);
}
