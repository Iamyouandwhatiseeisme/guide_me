import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data_layer/distance_calculator.dart';
import '../../data_layer/models/nearby_places_model.dart';

part 'sightseeing_sorting_state.dart';

class SightseeingSortingCubit extends Cubit<SightseeingSortingState> {
  SightseeingSortingCubit() : super(SightseeingSortingInitial());
  void sortList(
      List<NearbyPlacesModel> unsortedList,
      int sortingOption,
      double userLat,
      double userLon,
      Map<NearbyPlacesModel, double?> distanceMap) {
    switch (sortingOption) {
      case 0:
        unsortedList.sort((a, b) {
          final aPriceLevel = a.priceLevel ?? 0;
          final bPriceLevel = b.priceLevel ?? 0;
          return aPriceLevel.compareTo(bPriceLevel);
        });
        break;
      case 1:
        unsortedList.sort((a, b) {
          final aRating = a.rating ?? 0;
          final bRating = b.rating ?? 0;
          final aTotalRating = a.userRatingsTotal ?? 0;
          final bTotalRating = b.userRatingsTotal ?? 0;

          final aScore = aRating * aTotalRating;
          final bScore = bRating * bTotalRating;
          return bScore.compareTo(aScore); // Sort in descending order
        });
        break;
      case 2:
        unsortedList.sort((a, b) {
          final aDistance = calculateDistance(
            a.lat,
            a.lng,
            userLat, // Make sure to pass userLat and userLon to the Cubit
            userLon,
          );
          final bDistance = calculateDistance(
            b.lat,
            b.lng,
            userLat,
            userLon,
          );

          return aDistance!.compareTo(bDistance!);
        });

        break;
    }
    createDistanceMap(distanceMap, unsortedList, userLat, userLon);
    emit(SightseeingsortingLoaded(unsortedList));
  }

  void createDistanceMap(
      Map<NearbyPlacesModel, double?> distanceMap,
      List<NearbyPlacesModel> listOfDestinations,
      double userLat,
      double userLon) {
    for (int i = 0; i < listOfDestinations.length; i++) {
      double? distance = calculateDistance(listOfDestinations[i].lat,
          listOfDestinations[i].lng, userLat, userLon);
      String roundedValue = distance!.toStringAsFixed(2);
      double.parse(roundedValue);
      distanceMap.putIfAbsent(
          listOfDestinations[i], () => double.parse(roundedValue));
    }
  }
}
