import 'package:guide_me/bloc/cubits.dart';
import 'package:guide_me/data/data.dart';

class SearchesPagePayload {
  final List<NearbyPlacesModel> listToBuild;
  final FetchSearchedItemsCubit fetchSearchedItemsCubit;
  final UserLocation userLocation;

  SearchesPagePayload(
      {required this.listToBuild,
      required this.fetchSearchedItemsCubit,
      required this.userLocation});
}
