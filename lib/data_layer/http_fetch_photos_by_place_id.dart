import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<String>> fetChPhotosHelper(
    List<String> listOfPhotos, String placeId) async {
  final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=photos&key=AIzaSyDFwz7Nk7baEraJxw-23Wc68rdeib0eTzQ');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // Successful request, parse the JSON.
    final data = json.decode(response.body);

    final List<dynamic>? photos = data['result']['photos'];

    if (photos != null && photos.isNotEmpty) {
      List<String> photoUrls = [];
      for (var photo in photos) {
        final photoReference = photo['photo_reference'];
        const maxWidth = 1000;
        final photoUrl = Uri.parse(
            'https://maps.googleapis.com/maps/api/place/photo?maxwidth=$maxWidth&photoreference=$photoReference&key=AIzaSyDFwz7Nk7baEraJxw-23Wc68rdeib0eTzQ');
        photoUrls.add(photoUrl.toString());
      }
      return photoUrls;
    } else {
      return [];
    }

    // Continue with JSON parsing.
  } else {
    // Handle the error if the request was not successful.

    throw Exception('Failed to fetch photos');
  }
}
