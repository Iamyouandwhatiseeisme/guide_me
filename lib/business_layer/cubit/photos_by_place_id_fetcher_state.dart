// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'photos_by_place_id_fetcher_cubit.dart';

sealed class PhotosByPlaceIdFetcherState extends Equatable {
  const PhotosByPlaceIdFetcherState();

  @override
  List<Object> get props => [];
}

class PhotosByPlaceIdFetcherInitial extends PhotosByPlaceIdFetcherState {}

class PhotosByPlaceIdFetcherLoading extends PhotosByPlaceIdFetcherState {}

class PhotosByPlaceIdFetcherLoaded extends PhotosByPlaceIdFetcherState {
  final List<String> photosByPlaceId;

  const PhotosByPlaceIdFetcherLoaded(this.photosByPlaceId);
  @override
  List<Object> get props => [photosByPlaceId];
}

class PhotosByPlaceIdFetcherError extends PhotosByPlaceIdFetcherState {
  final String errorMessage;
  const PhotosByPlaceIdFetcherError({
    required this.errorMessage,
  });
  @override
  List<Object> get props => [errorMessage];
}
