import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guide_me/data/data.dart';

part 'sightseeing_sorting_state.dart';

class SightseeingSortingCubit extends Cubit<SightseeingSortingState> {
  SightseeingSortingCubit() : super(SightseeingSortingInitial());
  void sortList(
      {required List<NearbyPlacesModel> unsortedList,
      required int sortingOption,
      required UserLocation userLocation,
      required Map<NearbyPlacesModel, double?> distanceMap}) {
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
            startLat: a.lat,
            startLon: a.lng,
            endLat: userLocation
                .userLat, // Make sure to pass userLat and userLon to the Cubit
            endLon: userLocation
                .userLon, // Make sure to pass userLat and userLon to the Cubit
          );
          final bDistance = calculateDistance(
            startLat: b.lat,
            startLon: b.lng,
            endLat: userLocation
                .userLat, // Make sure to pass userLat and userLon to the Cubit
            endLon: userLocation.userLon,
          );

          return aDistance!.compareTo(bDistance!);
        });
        sortedList = unsortedList;

        break;
    }

    createDistanceMap(
      distanceMap: distanceMap,
      listOfDestinations: sortedList,
    );
    emit(SightseeingsortingLoaded(sortedList));
  }
}
