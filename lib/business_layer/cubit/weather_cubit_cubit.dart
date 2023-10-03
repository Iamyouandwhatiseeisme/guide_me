import 'package:bloc/bloc.dart';

import 'package:guide_me/data_layer/http_fetch_current_temperature.dart';

part 'weather_cubit_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherState());

  Future fetchWeather(double latitude, double longitude) async {
    if (state.temperature == null) {
      print('attempting fetch');
      try {
        final weather = await fetchTemperature(latitude, longitude);
        emit(WeatherState(
          temperature: weather.temperature,
          windSpeed: weather.windSpeed,
        ));
      } catch (e) {
        // Handle error here
        emit(WeatherState(temperature: null, windSpeed: null));
      }
    }
    throw Exception('Not able to fetch data');
  }
}
