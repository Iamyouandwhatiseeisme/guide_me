import 'package:guide_me/data_layer/distance_calculator.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';

void createDistanceMap(
    Map<NearbyPlacesModel, double?> distanceMap,
    List<NearbyPlacesModel> listOfDestinations,
    double userLat,
    double userLon) {
  for (int i = 0; i < listOfDestinations.length; i++) {
    double? distance = calculateDistance(
        listOfDestinations[i].lat, listOfDestinations[i].lng, userLat, userLon);
    String roundedValue = distance!.toStringAsFixed(2);
    double.parse(roundedValue);
    distanceMap.putIfAbsent(
        listOfDestinations[i], () => double.parse(roundedValue));
  }
}
