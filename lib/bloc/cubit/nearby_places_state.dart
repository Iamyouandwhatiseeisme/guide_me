import 'package:equatable/equatable.dart';
import 'package:guide_me/data/data.dart';

abstract class NearbyPlacesState extends Equatable {
  const NearbyPlacesState();

  @override
  List<Object> get props => [];
}

class NearbyPlacesInitial extends NearbyPlacesState {}

class NearbyPlacesLoading extends NearbyPlacesState {}

class NearbyPlacesLoaded extends NearbyPlacesState {
  final List<NearbyPlacesModel> listOfNearbyPlaces;

  const NearbyPlacesLoaded(this.listOfNearbyPlaces);

  @override
  List<Object> get props => [listOfNearbyPlaces];
}

class NearbyPlacesError extends NearbyPlacesState {
  final String errorMessage;

  const NearbyPlacesError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
