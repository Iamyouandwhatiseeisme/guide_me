// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:guide_me/presentation_layer/widgets/navigation/navigator_client.dart';

import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../../../../data_layer/models/nearby_places_model.dart';

class RecommenPlacesCardBuilder extends StatelessWidget {
  const RecommenPlacesCardBuilder({
    Key? key,
    required this.listOfNearbyPlaces,
  }) : super(key: key);

  final List<NearbyPlacesModel> listOfNearbyPlaces;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
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
                  child: GestureDetector(
                    onTap: () {
                      final placePagePayLoad =
                          PlacePagePayLoad(model: listOfNearbyPlaces[index]);
                      Navigator.pushNamed(context, NavigatorClient.placePage,
                          arguments: [placePagePayLoad]);
                    },
                    child: PlaceCard(
                      place: listOfNearbyPlaces[index],
                    ),
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
