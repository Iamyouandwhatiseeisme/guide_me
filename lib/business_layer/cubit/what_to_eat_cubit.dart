import 'package:bloc/bloc.dart';

import 'package:guide_me/business_layer/cubit/what_to_eat_state.dart';
import 'package:guide_me/data_layer/httpClients/google_api_client.dart';

import 'package:guide_me/data_layer/models/nearby_places_model.dart';

class WhatToEatCubit extends Cubit<WhatToEatState> {
  WhatToEatCubit() : super(WhatToEatInitial());
  void fetchPlacesForWhatToEat(List<NearbyPlacesModel> listOfpLacesForWhatToEat,
      GoogleApiClient googleApiClient) async {
    try {
      emit(WhatToEatLoading());
      final listOfSightseeings = await googleApiClient.fetchPlacesForFoodData(
        listOfpLacesForWhatToEat,
      );

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
