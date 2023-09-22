import 'package:flutter/material.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../../data_layer/models/nearby_places_model.dart';

class RecommenPlacesCardBuilder extends StatelessWidget {
  const RecommenPlacesCardBuilder({
    super.key,
    required this.listOfNearbyPlaces,
  });

  final List<NearbyPlacesModel> listOfNearbyPlaces;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 430,
      height: 150,
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listOfNearbyPlaces.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, right: 24),
                child: SizedBox(
                  height: 140,
                  width: 160,
                  child: PlaceCard(
                    place: listOfNearbyPlaces[index],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
