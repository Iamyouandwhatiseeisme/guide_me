import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data_layer/distance_calculator.dart';
import '../../data_layer/models/nearby_places_model.dart';

part 'sightseeing_sorting_state.dart';

class SightseeingSortingCubit extends Cubit<SightseeingSortingState> {
  SightseeingSortingCubit() : super(SightseeingSortingInitial());
  void sortList(List<NearbyPlacesModel> unsortedList, int sortingOption,
      double userLat, double userLon) {
    List<NearbyPlacesModel> sortedList = List.from(unsortedList);

    switch (sortingOption) {
      case 0:
        sortedList.sort((a, b) {
          final aPriceLevel = a.priceLevel ?? 0;
          final bPriceLevel = b.priceLevel ?? 0;
          return aPriceLevel.compareTo(bPriceLevel);
        });
        break;
      case 1:
        sortedList.sort((a, b) {
          final aRating = a.rating ?? 0;
          final bRating = b.rating ?? 0;
          return bRating.compareTo(aRating); // Sort in descending order
        });
        break;
      case 2:
        sortedList.sort((a, b) {
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

    emit(SightseeingsortingLoaded(sortedList));
  }
}
