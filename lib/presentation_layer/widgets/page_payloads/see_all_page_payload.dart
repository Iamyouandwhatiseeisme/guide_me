import '../../../business_layer/cubits.dart';
import '../../../data_layer/models/nearby_places_model.dart';

class SeeAllPagePayload {
  final List<NearbyPlacesModel> listToBuild;
  final double userLat;
  final double userLon;
  final SightseeingSortingCubit sortingCubit;
  final SorterToggleButtonCubit sorterToggleButtonCubit;

  SeeAllPagePayload(
      {required this.listToBuild,
      required this.userLat,
      required this.userLon,
      required this.sortingCubit,
      required this.sorterToggleButtonCubit});
}
