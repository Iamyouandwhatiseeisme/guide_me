import 'package:flutter/material.dart';
import 'package:guide_me/data/data.dart';

class NameLabelForCardsOnFavoritesPage extends StatelessWidget {
  const NameLabelForCardsOnFavoritesPage({
    super.key,
    required this.place,
    required this.color,
  });
  final Color color;
  final NearbyPlacesModel place;

  @override
  Widget build(BuildContext context) {
    return Text(
      place.name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12, color: color),
    );
  }
}
