part of 'fetch_searched_items_cubit.dart';

sealed class FetchSearchedItemsState extends Equatable {
  const FetchSearchedItemsState();

  @override
  List<Object> get props => [];
}

final class FetchSearchedItemsInitial extends FetchSearchedItemsState {}

class FetchSearchedItemsLoading extends FetchSearchedItemsState {}

class FetchSearchedItemsLoaded extends FetchSearchedItemsState {
  final List<NearbyPlacesModel> listOfSearched;

  const FetchSearchedItemsLoaded(this.listOfSearched);

  @override
  List<Object> get props => [listOfSearched];
}

class FetchSearchedItemsError extends FetchSearchedItemsState {
  final String errorMessage;

  const FetchSearchedItemsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
