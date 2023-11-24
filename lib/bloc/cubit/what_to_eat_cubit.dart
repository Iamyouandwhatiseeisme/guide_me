import 'package:bloc/bloc.dart';
import 'package:guide_me/bloc/cubits.dart';

import 'package:guide_me/data/data.dart';

class WhatToEatCubit extends Cubit<WhatToEatState> {
  WhatToEatCubit() : super(WhatToEatInitial());
  void fetchPlacesForWhatToEat(
      {required List<NearbyPlacesModel> listOfPlacesForFood,
      required GoogleDataSource googleApiClient}) async {
    try {
      emit(WhatToEatLoading());
      final listOfSightseeings = await googleApiClient.fetchPlacesForFoodData(
        listOfPlacesForFood,
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
