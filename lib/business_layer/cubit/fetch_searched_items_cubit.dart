import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guide_me/data/data.dart';

part 'fetch_searched_items_state.dart';

class FetchSearchedItemsCubit extends Cubit<FetchSearchedItemsState> {
  FetchSearchedItemsCubit() : super(FetchSearchedItemsInitial());
  Future<void> searchListFetcher(
      {required String nameOfPlace,
      required List<NearbyPlacesModel> listOfSearched,
      required GoogleApiClient googleApiClient}) async {
    try {
      emit(FetchSearchedItemsLoading());
      final listOfFetchedSearches = await googleApiClient.fetchForSearchList(
        nameOfPlace: nameOfPlace,
        listOfSearchedItems: listOfSearched,
      );

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
