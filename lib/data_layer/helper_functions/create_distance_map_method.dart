import 'package:guide_me/data_layer/helper_functions/distance_calculator.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/data_layer/models/user_location_class.dart';
import 'package:guide_me/main.dart';

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
