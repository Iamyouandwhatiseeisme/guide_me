import 'package:guide_me/bloc/cubits.dart';
import 'package:guide_me/data/data.dart';

class SeeAllPagePayload {
  final List<NearbyPlacesModel> listToBuild;
  final UserLocation userLocation;
  final SortingCubit sortingCubit;
  final SorterToggleButtonCubit sorterToggleButtonCubit;
  final Map<NearbyPlacesModel, double?> distanceMap;

  SeeAllPagePayload(
      {required this.distanceMap,
      required this.listToBuild,
      required this.userLocation,
      required this.sortingCubit,
      required this.sorterToggleButtonCubit});
}
