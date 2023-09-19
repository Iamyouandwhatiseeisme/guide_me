import 'package:flutter/material.dart';

import '../../data_layer/models/nearby_places_model.dart';

class recommended_places_card_builder extends StatelessWidget {
  const recommended_places_card_builder({
    super.key,
    required this.listOfNearbyPlaces,
  });

  final List<NearbyPlacesModel> listOfNearbyPlaces;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 20, top: 22, right: 24),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: PlaceCard(
                place: listOfNearbyPlaces[index],
              ),
            ),
          );
        },
        itemCount: listOfNearbyPlaces.length,
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final NearbyPlacesModel place;

  PlaceCard({required this.place});

  @override
  Widget build(BuildContext context) {
    String? photoReference = place.photos?[0]['photo_reference'];
    if (photoReference != null) {
      return Container(
        width: 200, // Set the width of each card as needed
        child: Card(
          elevation: 4.0,
          child: Column(
            children: <Widget>[
              if (photoReference != null)
                Image.network(
                  'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&key=AIzaSyDFwz7Nk7baEraJxw-23Wc68rdeib0eTzQ',
                  width: 160,
                  height: 106,
                ), // Display the first photo (you may need to adjust this)
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(place.name),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        width: 200, // Set the width of each card as needed
        child: Card(
          elevation: 4.0,
          child: Column(
            children: <Widget>[
              if (photoReference != null)
                Image.network(
                  'https://static.vecteezy.com/system/resources/thumbnails/022/059/000/small/no-image-available-icon-vector.jpg',
                  width: 160,
                  height: 106,
                ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(place.name),
              ),
            ],
          ),
        ),
      );
    }
  }
}
