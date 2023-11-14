import 'package:bloc/bloc.dart';
import 'package:guide_me/business_layer/cubit/recommended_places_cubit_dart_state.dart';

import 'package:guide_me/data_layer/httpClients/google_api_client.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';

class NearbyPlacesCubit extends Cubit<NearbyPlacesState> {
  NearbyPlacesCubit() : super(NearbyPlacesInitial());
  bool nearbyPlacesFetched = false;
  void fetchNearbyPlaces(List<NearbyPlacesModel> listOfNearbyPlaces,
      double userLat, double userLon, GoogleApiClient googleApiClient) async {
    try {
      emit(NearbyPlacesLoading());
      final listOfPlaces =
          await googleApiClient.fetchData(listOfNearbyPlaces, userLat, userLon);

      emit(NearbyPlacesLoaded(listOfPlaces));
      nearbyPlacesFetched = true;
    } catch (error) {
      // Handle the error here
      emit(NearbyPlacesError('Failed to fetch nearby places: $error'));
    }
  }
}
