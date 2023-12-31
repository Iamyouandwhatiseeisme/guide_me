part of 'place_open_status_cubit.dart';

// Define an abstract class for the cubit's states
sealed class PlaceOpenStatusLabelState extends Equatable {
  const PlaceOpenStatusLabelState();

  @override
  List<String> get props => [];
}

final class PlaceOpenStatusInitial extends PlaceOpenStatusLabelState {}

final class PlaceOpenStatusReadyToFetch extends PlaceOpenStatusLabelState {}

// Define individual states as subclasses of the abstract class
class OpenNowState extends PlaceOpenStatusLabelState {
  final String openStatus;

  const OpenNowState(this.openStatus);

  @override
  List<String> get props => [openStatus];
}

class ClosedState extends PlaceOpenStatusLabelState {
  final String openStatus;

  const ClosedState(this.openStatus);
  @override
  List<String> get props => [openStatus];
}

class ErrorState extends PlaceOpenStatusLabelState {
  final String errorMessage;

  const ErrorState(this.errorMessage);
  @override
  List<String> get props => [errorMessage];
}
