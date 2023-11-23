part of 'sightseeing_sorting_cubit.dart';

sealed class SortingState extends Equatable {
  const SortingState();

  @override
  List<Object> get props => [];
}

final class SortingInitial extends SortingState {}

class SortingLoading extends SortingState {}

class SortingLoaded extends SortingState {
  final List<NearbyPlacesModel> sortedList;
  const SortingLoaded(this.sortedList);
}
