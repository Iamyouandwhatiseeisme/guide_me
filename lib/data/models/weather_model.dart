class WeatherModel {
  final String temperature;
  final String windSpeed;

  WeatherModel({required this.temperature, required this.windSpeed});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        temperature: json['temperature'].toString(),
        windSpeed: json['wind_speed'].toString());
  }
}
