import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guide_me/data_layer/helper_functions/http_helper_grocery_places.dart';

import '../../data_layer/models/nearby_places_model.dart';

part 'category_types_fetcher_state.dart';

class CategoryTypesFetcherCubit extends Cubit<CategoryTypesFetcherState> {
  CategoryTypesFetcherCubit() : super(CategoryTypesFetcherInitial());
  void fetchDataForCategories(List<NearbyPlacesModel> listOfPlaces,
      String apiKey, double userLat, double userLon, String category) async {
    if (listOfPlaces.isEmpty) {
      try {
        emit(CategoryTypesFetcherLoading());
        final listOfFetchedPlaces = await fetchDataForOtherCategories(
            listOfPlaces, apiKey, userLat, userLon, category);

        if (isClosed) {
          return;
        }

        emit(CategoryTypesFetcherLoaded(listOfFetchedPlaces));
      } catch (error) {
        // Handle the error here
        emit(
            CategoryTypesFetcherError('Failed to fetch nearby places: $error'));
      }
    }
  }
}
