import 'package:guide_me/data_layer/helper_functions/distance_calculator.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/data_layer/models/user_location_class.dart';
import 'package:guide_me/main.dart';

void createDistanceMap(
  Map<NearbyPlacesModel, double?> distanceMap,
  List<NearbyPlacesModel> listOfDestinations,
) {
  final UserLocation userLocation = sl.sl.get<UserLocation>();
  for (int i = 0; i < listOfDestinations.length; i++) {
    double? distance = calculateDistance(listOfDestinations[i].lat,
        listOfDestinations[i].lng, userLocation.userLat, userLocation.userLon);
    String roundedValue = distance!.toStringAsFixed(2);
    double.parse(roundedValue);
    distanceMap.putIfAbsent(
        listOfDestinations[i], () => double.parse(roundedValue));
  }
}
