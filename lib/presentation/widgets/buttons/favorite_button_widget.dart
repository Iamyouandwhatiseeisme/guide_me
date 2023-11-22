import 'package:flutter/material.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/main.dart';
import 'package:hive/hive.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.placeToDisplay,
    required this.box,
  });

  final NearbyPlacesModel placeToDisplay;
  final Box<NearbyPlacesModel> box;

  @override
  Widget build(BuildContext context) {
    final localDataBase = sl.get<LocalDataSource>();
    return GestureDetector(
      onTap: () async {
        localDataBase.toggleFavorites(item: placeToDisplay, box: box);
      },
      child: Center(
          child: Icon(
        box.containsKey(placeToDisplay.hashCode)
            ? Icons.favorite
            : Icons.favorite_outline,
      )),
    );
  }
}
