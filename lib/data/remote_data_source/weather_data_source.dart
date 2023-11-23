import 'dart:convert';

import 'package:guide_me/data/data.dart';
import 'package:http/http.dart' as http;

class WeatherDataSource {
  Future<WeatherModel> fetchTemperature(
      {required double lat, required double lon}) async {
    final url = Uri.parse(
        "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current_weather=true&hourly=temperature_2m,relativehumidity_2m,windspeed_10m");
    try {
      final response = await http.get(url);

      try {
        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);

          final currentWeatherData = jsonData['current_weather'];
          // final temperature = currentWeatherData['temperature'].toString();
          // final windSpeed = currentWeatherData['windspeed'].toString();
          WeatherModel.fromJson(currentWeatherData);
          return WeatherModel.fromJson(currentWeatherData);
        }
      } on Exception catch (e) {
        throw Exception(e);
      }
    } catch (e) {
      return WeatherModel(temperature: 'N/A', windSpeed: 'N/A');
    }
    throw Exception('Not able to fetch data');
  }
}
