import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business_layer/cubit/weather_cubit_cubit.dart';

Future<void> loadData(BuildContext context, double lat, double lon,
    Completer<String> googleMapLocationCompleter) async {
  final weatherCubit = BlocProvider.of<WeatherCubit>(context);

  // Fetch weather data using lat and lon
  await weatherCubit.fetchWeather(lat, lon);

  googleMapLocationCompleter.complete('Completed');
}
