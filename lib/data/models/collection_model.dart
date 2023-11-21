import 'package:hive/hive.dart';

import 'nearby_places_model.dart';

part 'collection_model.g.dart'; // Generated part file

@HiveType(typeId: 3) // Unique type ID for the adapter
class CollectionModel {
  @HiveField(0) // Field ID for the name
  String name;

  @HiveField(1) // Field ID for the items
  List<NearbyPlacesModel> items;

  CollectionModel({required this.name, required this.items});
}
