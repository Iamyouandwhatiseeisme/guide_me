import 'package:bloc/bloc.dart';
import 'package:guide_me/data/data.dart';

import 'nearby_places_state.dart';

class NearbyPlacesCubit extends Cubit<NearbyPlacesState> {
  NearbyPlacesCubit() : super(NearbyPlacesInitial());
  bool nearbyPlacesFetched = false;
  void fetchNearbyPlaces(
      {required List<NearbyPlacesModel> listOfNearbyPlaces,
      required GoogleApiClient googleApiClient}) async {
    try {
      emit(NearbyPlacesLoading());
      final listOfPlaces = await googleApiClient.fetchData(
        listOfNearbyPlaces,
      );

      emit(NearbyPlacesLoaded(listOfPlaces));
      nearbyPlacesFetched = true;
    } catch (error) {
      // Handle the error here
      emit(NearbyPlacesError('Failed to fetch nearby places: $error'));
    }
  }
}
