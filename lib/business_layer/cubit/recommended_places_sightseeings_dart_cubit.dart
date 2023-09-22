import 'package:bloc/bloc.dart';

import 'package:guide_me/business_layer/cubit/recommended_places_sightseeings_dart_state.dart';

import 'package:guide_me/data_layer/http_helper_nearby_sightseeings.dart';

class NearbySightSeeingCubit extends Cubit<NearbySightseeingsState> {
  NearbySightSeeingCubit() : super(NearbySightseeingsInitial());
  void fetchNearbySightseeings() async {
    try {
      emit(NearbySightseeingsLoading());
      final listOfSightseeings = await fetchSightseeingData([]);

      emit(NearbySightseeingsLoaded(listOfSightseeings));
    } catch (error) {
      // Handle the error here
      emit(NearbySightseeingsError('Failed to fetch nearby places: $error'));
    }
  }
}
