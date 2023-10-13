// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:guide_me/data_layer/models/opening_hours.dart';
import 'package:hive/hive.dart';

part 'nearby_places_model.g.dart';

@HiveType(typeId: 0)
class NearbyPlacesModel extends HiveObject {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final OpeningHours? openingHours;
  @HiveField(3)
  final List<dynamic>? photos;
  @HiveField(4)
  final num? rating;
  @HiveField(5)
  final List<dynamic> types;
  @HiveField(6)
  final bool? openNow;
  @HiveField(7)
  final int? userRatingsTotal;
  @HiveField(8)
  final String? vicinity;
  @HiveField(9)
  final double? lat;
  @HiveField(10)
  final double? lng;
  @HiveField(11)
  final String placeId;

  NearbyPlacesModel(
      {this.id,
      required this.name,
      required this.openingHours,
      required this.photos,
      required this.rating,
      required this.types,
      required this.openNow,
      required this.userRatingsTotal,
      required this.vicinity,
      required this.lat,
      required this.lng,
      required this.placeId});

  @override
  int get hashCode => placeId.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NearbyPlacesModel && other.placeId == placeId;
  }

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
        photos: json['photos'],
        openNow: openingHoursJson != null ? openingHoursJson['open_now'] : null,
        userRatingsTotal: json['user_ratings_total'],
        types: json['types'],
        vicinity: json['vicinity'],
        lat: locationJson != null ? locationJson['lat'] : 0.0,
        lng: locationJson != null ? locationJson['lng'] : 0.0,
        placeId: json['place_id'] ?? 'No PlaceId Available');
  }
}
