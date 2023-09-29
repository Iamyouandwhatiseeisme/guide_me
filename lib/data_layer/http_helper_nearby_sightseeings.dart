import 'dart:convert';

import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:http/http.dart' as http;

Future<List<NearbyPlacesModel>> fetchSightseeingData(
    List<NearbyPlacesModel> listOfSightseeingPlaces,
    String apiKey,
    double userLat,
    double userLon) async {
  final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$userLat,$userLon&radius=8000&type=hotel|food&key=$apiKey');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    // Successful request, parse the JSON.
    final jsonData = json.decode(response.body);
    final places = jsonData['results'];
    for (var placeData in places) {
      var place = NearbyPlacesModel.fromJason(placeData);
      if (place.vicinity != 'Tbilisi') {
        listOfSightseeingPlaces.add(place);
      }
    }

    return listOfSightseeingPlaces;
    // Continue with JSON parsing.
  } else {
    // Handle the error if the request was not successful.

    throw Exception('Failed to fetch nearby sightseeing places');
  }
}
