import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:guide_me/business_layer/cubit/recommended_places_cubit_dart_state.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'package:guide_me/data_layer/http_helper_nearby_places.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';

class NearbyPlacesCubit extends Cubit<NearbyPlacesState> {
  NearbyPlacesCubit() : super(NearbyPlacesInitial());
  void fetchNearbyPlaces() async {
    try {
      emit(NearbyPlacesLoading());
      final listOfPlaces = await fetchData([]);

      emit(NearbyPlacesLoaded(listOfPlaces));
    } catch (error) {
      // Handle the error here
      emit(NearbyPlacesError('Failed to fetch nearby places: $error'));

      print('Failed to fetch nearby places: $error');
    }
  }
}
