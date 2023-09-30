import 'dart:convert';

import 'package:guide_me/data_layer/models/weather_model.dart';
import 'package:http/http.dart' as http;

Future<WeatherModel> fetchTemperature(double lat, double lon) async {
  final url = Uri.parse(
      "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current_weather=true&hourly=temperature_2m,relativehumidity_2m,windspeed_10m");
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);

    final currentWeatherData = jsonData['current_weather'];
    final temperature = currentWeatherData['temperature'].toString();
    final windSpeed = currentWeatherData['windspeed'].toString();

    return WeatherModel(temperature: temperature, windSpeed: windSpeed);
  }

  return throw Exception('Failed to fetch temperature information');
}
