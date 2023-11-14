import 'package:guide_me/data_layer/models/nearby_places_model.dart';

import '../../../business_layer/cubit/fetch_searched_items_cubit.dart';

class SearchesPagePayload {
  final List<NearbyPlacesModel> listToBuild;
  final FetchSearchedItemsCubit fetchSearchedItemsCubit;
  final double userLat;
  final double userLon;

  SearchesPagePayload(
      {required this.listToBuild,
      required this.fetchSearchedItemsCubit,
      required this.userLat,
      required this.userLon});
}
