import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String?, String?>> fetchDetails(
    String placeId, String apiKey) async {
  final apiUrl =
      'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey';

  try {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['status'] == 'OK') {
        final phoneNumber =
            data['result']['formatted_phone_number'] ?? 'No Number';

        final formattedAdress =
            data['result']['formatted_address'] ?? 'No Address';

        final periods = data['result']["current_opening_hours"]?["periods"];
        String openTime;
        String closeTime;
        if (periods != null && periods.isNotEmpty) {
          openTime = periods[0]["open"]["time"] ?? "No Information";
          closeTime = periods[0]["close"]["time"] ?? "No Information";
        } else {
          openTime = "N/a N/a";
          closeTime = "N/a N/a";
        }

        return {
          'phone': phoneNumber,
          'adress': formattedAdress,
          'open_hour': openTime,
          'close_hour': closeTime
        };
      } else {
        throw ('Data status != ok');
      }
    } else {
      throw ('Failed to fetch');
    }
  } catch (error) {
    rethrow;
  }
}