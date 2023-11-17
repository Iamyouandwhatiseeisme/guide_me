import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guide_me/data_layer/data.dart';

import '../../data_layer/helper_functions/distance_calculator.dart';
import '../../data_layer/models/nearby_places_model.dart';

part 'sightseeing_sorting_state.dart';

class SightseeingSortingCubit extends Cubit<SightseeingSortingState> {
  SightseeingSortingCubit() : super(SightseeingSortingInitial());
  void sortList(List<NearbyPlacesModel> unsortedList, int sortingOption,
      UserLocation userLocation, Map<NearbyPlacesModel, double?> distanceMap) {
    List<NearbyPlacesModel> sortedList = [];
    emit(SightseeingsortingLoading());
    switch (sortingOption) {
      case 0:
        unsortedList.sort((a, b) {
          final aRating = a.rating ?? 0;
          final bRating = b.rating ?? 0;
          final aTotalRating = a.userRatingsTotal ?? 0;
          final bTotalRating = b.userRatingsTotal ?? 0;

          final aScore = aRating * aTotalRating;
          final bScore = bRating * bTotalRating;
          return bScore.compareTo(aScore); // Sort in descending order
        });
        sortedList = unsortedList;
        break;
      case 1:
        unsortedList.sort((a, b) {
          final aDistance = calculateDistance(
            a.lat,
            a.lng,
            userLocation
                .userLat, // Make sure to pass userLat and userLon to the Cubit
            userLocation
                .userLon, // Make sure to pass userLat and userLon to the Cubit
          );
          final bDistance = calculateDistance(
            b.lat,
            b.lng,
            userLocation
                .userLat, // Make sure to pass userLat and userLon to the Cubit
            userLocation.userLon,
          );

          return aDistance!.compareTo(bDistance!);
        });
        sortedList = unsortedList;

        break;
    }

    createDistanceMap(
      distanceMap,
      sortedList,
    );
    emit(SightseeingsortingLoaded(sortedList));
  }
}
