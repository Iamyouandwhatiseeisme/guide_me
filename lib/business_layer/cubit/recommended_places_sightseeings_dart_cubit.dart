import 'package:bloc/bloc.dart';

import 'package:guide_me/business_layer/cubit/recommended_places_sightseeings_dart_state.dart';

import 'package:guide_me/data_layer/httpClients/google_api_client.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';

class NearbySightSeeingCubit extends Cubit<NearbySightseeingsState> {
  NearbySightSeeingCubit() : super(NearbySightseeingsInitial());
  void fetchNearbySightseeings(List<NearbyPlacesModel> listOfNearbySightseeings,
      double userLat, double userLon, GoogleApiClient googleApiClient) async {
    try {
      emit(NearbySightseeingsLoading());
      final listOfSightseeings = await googleApiClient.fetchSightseeingData(
          listOfNearbySightseeings, userLat, userLon);

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
