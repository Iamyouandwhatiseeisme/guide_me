import 'package:bloc/bloc.dart';
import 'package:guide_me/data/data.dart';

part 'weather_cubit_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherState());

  Future<void> fetchWeather(
      {required double latitude,
      required double longitude,
      required WeatherDataSource weatherApiClient}) async {
    if (state.temperature == null) {
      try {
        final weather = await weatherApiClient.fetchTemperature(
            lat: latitude, lon: longitude);
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
