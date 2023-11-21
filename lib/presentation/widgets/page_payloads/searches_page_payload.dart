import 'package:guide_me/data/data.dart';

import '../../../business_layer/cubit/fetch_searched_items_cubit.dart';

class SearchesPagePayload {
  final List<NearbyPlacesModel> listToBuild;
  final FetchSearchedItemsCubit fetchSearchedItemsCubit;
  final UserLocation userLocation;

  SearchesPagePayload(
      {required this.listToBuild,
      required this.fetchSearchedItemsCubit,
      required this.userLocation});
}
