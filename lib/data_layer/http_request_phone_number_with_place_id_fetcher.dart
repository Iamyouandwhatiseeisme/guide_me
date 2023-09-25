import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String?, String?>> fetchPhoneNumber(String placeId) async {
  final apiUrl =
      'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=formatted_phone_number,formatted_address&key=AIzaSyDFwz7Nk7baEraJxw-23Wc68rdeib0eTzQ';

  try {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['status'] == 'OK') {
        final phoneNumber =
            data['result']['formatted_phone_number'] ?? 'No Number';

        final formattedAdress =
            data['result']['formatted_address'] ?? 'No Address';

        return {'phone': phoneNumber, 'adress': formattedAdress};
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
