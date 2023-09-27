import 'package:http/http.dart' as http;
import 'dart:convert';

class GeocodingUtil {
  static Future<String> reverseGeocode(
      double latitude, double longitude, String apiKey) async {
    final apiUrl =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey';
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final results = jsonBody['results'] as List<dynamic>;

      if (results.isNotEmpty) {
        final addressComponents =
            results[0]['address_components'] as List<dynamic>;
        String city = '';
        String country = '';

        for (final component in addressComponents) {
          final types = component['types'] as List<dynamic>;

          if (types.contains('locality')) {
            city = component['long_name'];
          } else if (types.contains('country')) {
            country = component['long_name'];
          }
        }

        return '$city, $country';
      }
    }

    return 'Location not found';
  }
}
