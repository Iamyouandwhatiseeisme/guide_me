import 'package:bloc/bloc.dart';

import 'package:guide_me/business_layer/cubit/what_to_eat_state.dart';
import 'package:guide_me/data/data.dart';

class WhatToEatCubit extends Cubit<WhatToEatState> {
  WhatToEatCubit() : super(WhatToEatInitial());
  void fetchPlacesForWhatToEat(
      {required List<NearbyPlacesModel> listOfpLacesForWhatToEat,
      required GoogleApiClient googleApiClient}) async {
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
