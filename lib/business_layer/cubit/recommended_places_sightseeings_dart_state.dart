import 'package:equatable/equatable.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';

abstract class NearbySightseeingsState extends Equatable {
  const NearbySightseeingsState();

  @override
  List<Object> get props => [];
}

class NearbySightseeingsInitial extends NearbySightseeingsState {}

class NearbySightseeingsLoading extends NearbySightseeingsState {}

class NearbySightseeingsLoaded extends NearbySightseeingsState {
  final List<NearbyPlacesModel> listOfSightseeings;

  const NearbySightseeingsLoaded(this.listOfSightseeings);

  @override
  List<Object> get props => [listOfSightseeings];
}

class NearbySightseeingsError extends NearbySightseeingsState {
  final String errorMessage;

  const NearbySightseeingsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
