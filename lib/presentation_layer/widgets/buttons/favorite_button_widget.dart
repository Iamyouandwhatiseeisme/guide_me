
import 'package:flutter/material.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/data_layer/toggle_favorites_function.dart';
import 'package:hive/hive.dart';

class FavoriteButton extends StatelessWidget {
  final Color color;

  const FavoriteButton({
    super.key,
    required this.color,
    required this.placeToDisplay,
    required this.box,
  });

  final NearbyPlacesModel placeToDisplay;
  final Box<NearbyPlacesModel> box;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        toggleFavorites(placeToDisplay, box);
      },
      child: Center(
          child: Icon(
              box.containsKey(placeToDisplay.hashCode)
                  ? Icons.favorite
                  : Icons.favorite_outline,
              color: color)),
    );
  }
}
