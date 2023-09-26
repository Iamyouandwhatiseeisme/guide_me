import 'dart:convert';

import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:http/http.dart' as http;

Future<List<NearbyPlacesModel>> fetchPlacesForFoodData(
    List<NearbyPlacesModel> listPlacesForFood) async {
  final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/place/textsearch/json?query=bar+food&key=AIzaSyDFwz7Nk7baEraJxw-23Wc68rdeib0eTzQ');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    // Successful request, parse the JSON.
    final jsonData = json.decode(response.body);
    final places = jsonData['results'];
    // print(places);
    for (var placeData in places) {
      var place = NearbyPlacesModel.fromJason(placeData);
      if (place.vicinity != 'Tbilisi') {
        listPlacesForFood.add(place);
      }
    }

    return listPlacesForFood;
    // Continue with JSON parsing.
  } else {
    // Handle the error if the request was not successful.

    throw Exception('Failed to fetch nearby sightseeing places');
  }
}
