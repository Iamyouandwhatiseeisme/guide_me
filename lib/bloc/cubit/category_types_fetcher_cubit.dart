import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guide_me/bloc/cubits.dart';
import 'package:guide_me/data/data.dart';

import '../../main.dart';

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

  void createList(
      {required Map<NearbyPlacesModel, double?> distanceMap,
      required String category,
      required SortingCubit sortingCubit,
      required List<NearbyPlacesModel> listOfPlaces,
      required Completer<String> listLoaderController}) {
    final googleDataSource = sl.get<GoogleDataSource>();
    emit(CategoryTypesFetcherLoading());
    try {
      googleDataSource.createList(
          distanceMap: distanceMap,
          category: category,
          sortingCubit: sortingCubit,
          categoryTypesFetcherCubit: this,
          listOfPlaces: listOfPlaces,
          listLoaderController: listLoaderController);
      emit(CategoryTypesFetcherLoaded(listOfPlaces));
    } on Exception catch (e) {
      emit(CategoryTypesFetcherError(e.toString()));
    }
  }
}
