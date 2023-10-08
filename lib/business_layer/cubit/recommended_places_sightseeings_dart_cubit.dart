import 'package:bloc/bloc.dart';

import 'package:guide_me/business_layer/cubit/recommended_places_sightseeings_dart_state.dart';

import 'package:guide_me/data_layer/helper_functions/http_helper_nearby_sightseeings.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';

class NearbySightSeeingCubit extends Cubit<NearbySightseeingsState> {
  NearbySightSeeingCubit() : super(NearbySightseeingsInitial());
  void fetchNearbySightseeings(List<NearbyPlacesModel> listOfNearbySightseeings,
      String apiKey, double userLat, double userLon) async {
    try {
      emit(NearbySightseeingsLoading());
      final listOfSightseeings = await fetchSightseeingData(
          listOfNearbySightseeings, apiKey, userLat, userLon);

      if (isClosed) {
        return;
      }

      emit(NearbySightseeingsLoaded(listOfSightseeings));
    } catch (error) {
      // Handle the error here
      emit(NearbySightseeingsError('Failed to fetch nearby places: $error'));
    }
  }
}
