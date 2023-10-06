part of 'category_types_fetcher_cubit.dart';

sealed class CategoryTypesFetcherState extends Equatable {
  const CategoryTypesFetcherState();

  @override
  List<Object> get props => [];
}

final class CategoryTypesFetcherInitial extends CategoryTypesFetcherState {}

class CategoryTypesFetcherLoading extends CategoryTypesFetcherState {}

class CategoryTypesFetcherLoaded extends CategoryTypesFetcherState {
  final List<NearbyPlacesModel> listOfPlaces;

  const CategoryTypesFetcherLoaded(this.listOfPlaces);

  @override
  List<Object> get props => [listOfPlaces];
}

class CategoryTypesFetcherError extends CategoryTypesFetcherState {
  final String errorMessage;

  const CategoryTypesFetcherError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
