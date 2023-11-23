import 'dart:async';


import 'package:bloc/bloc.dart';


import 'package:equatable/equatable.dart';


import 'package:guide_me/bloc/cubits.dart';


import 'package:guide_me/data/data.dart';


import '../../main.dart';


part 'load_data_state.dart';


class LoadDataCubit extends Cubit<LoadDataState> {

  LoadDataCubit() : super(LoadDataInitial());


  Future<void> loadData(

      {required WeatherCubit weatherCubit,

      required double lat,

      required double lon,

      required Completer<String> googleMapLocationCompleter}) async {

    // final weatherCubit = BlocProvider.of<WeatherCubit>(context);


    emit(LoadDataProcessing());


    // Fetch weather data using lat and lon


    await weatherCubit.fetchWeather(

        latitude: lat,

        longitude: lon,

        weatherApiClient: sl.get<WeatherDataSource>());


    googleMapLocationCompleter.complete('Completed');


    emit(LoadDataSuccessfull());

  }

}

