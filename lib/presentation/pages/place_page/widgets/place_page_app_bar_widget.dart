import 'package:flutter/material.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PlacePageAppbar extends StatelessWidget {
  final NearbyPlacesModel placeToDisplay;

  const PlacePageAppbar({
    required this.placeToDisplay,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(actions: [
      const Icon(
        Icons.share_outlined,
      ),
      const SizedBox(width: 24),
      Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ValueListenableBuilder(
              valueListenable:
                  Hive.box<NearbyPlacesModel>("FavoritedPlaces").listenable(),
              builder: (context, value, child) {
                return FavoriteButton(
                    placeToDisplay: placeToDisplay,
                    box: Hive.box<NearbyPlacesModel>("FavoritedPlaces"));
              }))
    ], backgroundColor: Theme.of(context).colorScheme.background);
  }
}
