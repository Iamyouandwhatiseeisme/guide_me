import 'package:flutter/material.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../../../data_layer/models/nearby_places_model.dart';

class SeeAllPageGridView extends StatelessWidget {
  const SeeAllPageGridView({
    super.key,
    required this.listTobuild,
    required this.distanceMap,
  });

  final List<NearbyPlacesModel>? listTobuild;
  final Map<NearbyPlacesModel, double?> distanceMap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1000,
      width: 460,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.70),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              final placePagePayLoad =
                  PlacePagePayLoad(model: listTobuild![index]);
              Navigator.pushNamed(
                context,
                'placePage',
                arguments: [placePagePayLoad],
              );
            },
            child: SightseeingsPlaceCard(
              place: listTobuild![index],
              distance: distanceMap[listTobuild![index]],
            ),
          );
        },
        itemCount: listTobuild!.length,
      ),
    );
  }
}
