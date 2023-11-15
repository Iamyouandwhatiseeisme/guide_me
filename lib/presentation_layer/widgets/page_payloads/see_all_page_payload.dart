import '../../../business_layer/cubits.dart';
import '../../../data_layer/data.dart';
import '../../../data_layer/models/nearby_places_model.dart';

class SeeAllPagePayload {
  final List<NearbyPlacesModel> listToBuild;
  final UserLocation userLocation;
  final SightseeingSortingCubit sortingCubit;
  final SorterToggleButtonCubit sorterToggleButtonCubit;

  SeeAllPagePayload(
      {required this.listToBuild,
      required this.userLocation,
      required this.sortingCubit,
      required this.sorterToggleButtonCubit});
}
