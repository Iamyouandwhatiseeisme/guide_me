import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data_layer/helper_functions/http_fetch_place_for_search_list.dart';
import '../../data_layer/models/nearby_places_model.dart';

part 'fetch_searched_items_state.dart';

class FetchSearchedItemsCubit extends Cubit<FetchSearchedItemsState> {
  FetchSearchedItemsCubit() : super(FetchSearchedItemsInitial());
  Future<void> searchListFetcher(
    String nameOfPlace,
    List<NearbyPlacesModel> listOfSearched,
    String apiKey,
  ) async {
    try {
      emit(FetchSearchedItemsLoading());
      final listOfFetchedSearches =
          await fetchForSearchList(nameOfPlace, listOfSearched, apiKey);

      if (isClosed) {
        return;
      }

      emit(FetchSearchedItemsLoaded(listOfFetchedSearches));
    } catch (error) {
      // Handle the error here
      emit(FetchSearchedItemsError('Failed to fetch nearby places: $error'));
    }
  }
}
