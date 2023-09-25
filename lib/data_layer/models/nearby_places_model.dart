// ignore_for_file: public_member_api_docs, sort_constructors_first


class NearbyPlacesModel {
  final String name;
  final OpeningHours? openingHours;
  final List<dynamic>? photos;
  final int? priceLevel;
  final num? rating;
  final List<dynamic> types;
  final bool? openNow;
  final int? userRatingsTotal;
  final String vicinity;
  final double? lat;
  final double? lng;
  final String placeId;

  NearbyPlacesModel(
      {required this.name,
      required this.openingHours,
      required this.photos,
      required this.priceLevel,
      required this.rating,
      required this.types,
      required this.openNow,
      required this.userRatingsTotal,
      required this.vicinity,
      required this.lat,
      required this.lng,
      required this.placeId});

  factory NearbyPlacesModel.fromJason(Map<String, dynamic> json) {
    final openingHoursJson = json['opening_hours'];
    final geometryJson = json['geometry'];
    final locationJson = geometryJson != null ? geometryJson['location'] : null;

    return NearbyPlacesModel(
        name: json['name'],
        openingHours: openingHoursJson != null
            ? OpeningHours.fromJson(openingHoursJson)
            : null,
        rating: json['rating'],
        priceLevel: json['price_level'],
        photos: json['photos'],
        openNow: openingHoursJson != null ? openingHoursJson['open_now'] : null,
        userRatingsTotal: json['user_ratings_total'],
        types: json['types'],
        vicinity: json['vicinity'],
        lat: locationJson != null ? locationJson['lat'] : 0.0,
        lng: locationJson != null ? locationJson['lng'] : 0.0,
        placeId: json['place_id']);
  }
}

class OpeningHours {
  final bool? openNow;

  OpeningHours({
    required this.openNow,
  });

  factory OpeningHours.fromJson(Map<String, dynamic> json) {
    return OpeningHours(
      openNow: json['open_now'],
    );
  }
}
