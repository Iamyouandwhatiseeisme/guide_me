import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guide_me/data/data.dart';

import '../../main.dart';

part 'sightseeing_sorting_state.dart';

class SortingCubit extends Cubit<SortingState> {
  SortingCubit() : super(SortingInitial());
  void sortList(
      {required List<NearbyPlacesModel> unsortedList,
      required SortingOption sortingOption,
      required UserLocation userLocation,
      required Map<NearbyPlacesModel, double?> distanceMap}) {
    List<NearbyPlacesModel> sortedList = [];
    emit(SortingLoading());
    print('print sorting $sortingOption');
    switch (sortingOption) {
      case SortingOption.byRating:
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
      case SortingOption.byDistance:
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
    print('print sorted ${sortedList.first.name}');
    emit(SortingLoaded(sortedList));
  }

  void createDistanceMap({
    required Map<NearbyPlacesModel, double?> distanceMap,
    required List<NearbyPlacesModel> listOfDestinations,
  }) {
    final UserLocation userLocation = sl.get<UserLocation>();
    for (int i = 0; i < listOfDestinations.length; i++) {
      double? distance = calculateDistance(
          startLat: listOfDestinations[i].lat,
          startLon: listOfDestinations[i].lng,
          endLat: userLocation.userLat,
          endLon: userLocation.userLon);
      String roundedValue = distance!.toStringAsFixed(2);
      double.parse(roundedValue);
      distanceMap.putIfAbsent(
          listOfDestinations[i], () => double.parse(roundedValue));
    }
  }

  double? calculateDistance({
    double? startLat,
    double? startLon,
    required double endLat,
    required double endLon,
  }) {
    if (startLat != null && startLon != null) {
      const double earthRadius = 6371.0; // Radius of the Earth in kilometers
      double radians(double degrees) {
        return degrees * (pi / 180.0);
      }

      // Convert latitude and longitude from degrees to radians
      final double lat1 = radians(startLat);
      final double lon1 = radians(startLon);
      final double lat2 = radians(endLat);
      final double lon2 = radians(endLon);

      // Haversine formula
      final double dlon = lon2 - lon1;
      final double dlat = lat2 - lat1;
      final double a =
          pow(sin(dlat / 2), 2) + cos(lat1) * cos(lat2) * pow(sin(dlon / 2), 2);
      final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

      // Calculate the distance
      final double distance = earthRadius * c;
      return distance;
    } else {
      return 0.0;
    }
  }
}
