import 'package:equatable/equatable.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';

abstract class NearbyPlacesState extends Equatable {
  const NearbyPlacesState();

  @override
  List<Object> get props => [];
}

class NearbyPlacesInitial extends NearbyPlacesState {}

class NearbyPlacesLoading extends NearbyPlacesState {}

class NearbyPlacesLoaded extends NearbyPlacesState {
  final List<NearbyPlacesModel> listOfNearbyPlaces;

  NearbyPlacesLoaded(this.listOfNearbyPlaces);

  @override
  List<Object> get props => [listOfNearbyPlaces];
}

class NearbyPlacesError extends NearbyPlacesState {
  final String errorMessage;

  NearbyPlacesError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
