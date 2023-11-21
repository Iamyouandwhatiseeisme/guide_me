import 'package:guide_me/data/data.dart';

import '../../../business_layer/cubits.dart';

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
