import 'dart:async';

import 'package:guide_me/bloc/cubits.dart';
import 'package:guide_me/data/data.dart';

import 'package:guide_me/main.dart';

Future<void> loadData(
    {required WeatherCubit weatherCubit,
    required double lat,
    required double lon,
    required Completer<String> googleMapLocationCompleter}) async {
  // final weatherCubit = BlocProvider.of<WeatherCubit>(context);

  // Fetch weather data using lat and lon
  await weatherCubit.fetchWeather(
      latitude: lat,
      longitude: lon,
      weatherApiClient: sl.get<WeatherApiClient>());

  googleMapLocationCompleter.complete('Completed');
}
