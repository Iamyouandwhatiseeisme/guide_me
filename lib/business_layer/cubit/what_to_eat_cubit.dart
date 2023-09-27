import 'dart:ffi';

import 'package:bloc/bloc.dart';

import 'package:guide_me/business_layer/cubit/what_to_eat_state.dart';

import 'package:guide_me/data_layer/models/nearby_places_model.dart';

import '../../data_layer/http_helper_places_for_food.dart';

class WhatToEatCubit extends Cubit<WhatToEatState> {
  WhatToEatCubit() : super(WhatToEatInitial());
  void fetchPlacesForWhatToEat(List<NearbyPlacesModel> listOfpLacesForWhatToEat,
      String apiKey, double userLat, double userLon) async {
    try {
      emit(WhatToEatLoading());
      final listOfSightseeings = await fetchPlacesForFoodData(
          listOfpLacesForWhatToEat, apiKey, userLat, userLon);

      if (isClosed) {
        return;
      }

      emit(WhatToEatLoaded(listOfSightseeings));
    } catch (error) {
      // Handle the error here
      emit(WhatToEatError('Failed to fetch nearby places: $error'));
    }
  }
}
