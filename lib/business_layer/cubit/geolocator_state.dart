part of 'geolocator_cubit.dart';

@immutable
abstract class LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final Position position;

  LocationLoaded(this.position);
}

class LocationErorr extends LocationState {
  final String message;
  LocationErorr(this.message);
}
