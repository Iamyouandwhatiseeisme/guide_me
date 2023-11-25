import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guide_me/data/data.dart';

part 'category_types_fetcher_state.dart';

class CategoryTypesFetcherCubit extends Cubit<CategoryTypesFetcherState> {
  CategoryTypesFetcherCubit() : super(CategoryTypesFetcherInitial());
  Future<void> fetchDataForCategories(
      {required List<NearbyPlacesModel> listOfPlaces,
      required String category,
      required GoogleDataSource googleApiClient}) async {
    if (listOfPlaces.isEmpty) {
      try {
        emit(CategoryTypesFetcherLoading());
        final listOfFetchedPlaces =
            await googleApiClient.fetchDataForOtherCategories(
                listOfPlaces: listOfPlaces, category: category);

        if (isClosed) {
          return;
        }
        listOfPlaces = listOfFetchedPlaces;
        emit(CategoryTypesFetcherLoaded(listOfFetchedPlaces));
      } catch (error) {
        // Handle the error here
        emit(
            CategoryTypesFetcherError('Failed to fetch nearby places: $error'));
      }
    }
  }
}
