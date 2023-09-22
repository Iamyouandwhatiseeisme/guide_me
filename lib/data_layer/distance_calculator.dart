import 'dart:math';

double? calculateDistance(
  double? startLat,
  double? startLng,
  double endLat,
  double endLng,
) {
  if (startLat != null && startLng != null) {
    const double earthRadius = 6371.0; // Radius of the Earth in kilometers
    double radians(double degrees) {
      return degrees * (pi / 180.0);
    }

    // Convert latitude and longitude from degrees to radians
    final double lat1 = radians(startLat);
    final double lon1 = radians(startLng);
    final double lat2 = radians(endLat);
    final double lon2 = radians(endLng);

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
