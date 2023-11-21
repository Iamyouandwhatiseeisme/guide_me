import 'package:bloc/bloc.dart';

import 'package:guide_me/data/data.dart';

import 'nearby_sightseeing_state.dart';

class NearbySightSeeingCubit extends Cubit<NearbySightseeingsState> {
  NearbySightSeeingCubit() : super(NearbySightseeingsInitial());
  void fetchNearbySightseeings(
      {required List<NearbyPlacesModel> listOfNearbySightseeings,
      required GoogleApiClient googleApiClient}) async {
    try {
      emit(NearbySightseeingsLoading());
      final listOfSightseeings = await googleApiClient.fetchSightseeingData(
        listOfNearbySightseeings,
      );

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
