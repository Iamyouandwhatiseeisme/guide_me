import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/data_layer/models/user_location_class.dart';

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
