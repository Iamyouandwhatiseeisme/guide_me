import 'package:bloc/bloc.dart';

import 'package:guide_me/data_layer/httpClients/weather_api_client.dart';

part 'weather_cubit_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherState());

  Future<void> fetchWeather(double latitude, double longitude,
      WeatherApiClient weatherApiClient) async {
    if (state.temperature == null) {
      try {
        final weather =
            await weatherApiClient.fetchTemperature(latitude, longitude);
        emit(WeatherState(
          temperature: weather.temperature,
          windSpeed: weather.windSpeed,
        ));
      } catch (e) {
        // Handle error here, if needed
        emit(WeatherState(temperature: null, windSpeed: null));
      }
    }
  }
}
