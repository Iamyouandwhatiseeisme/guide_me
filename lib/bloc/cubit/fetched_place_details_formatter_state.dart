part of 'fetched_place_details_formatter_cubit.dart';


sealed class FetchedPlaceDetailsFormatterState extends Equatable {

  const FetchedPlaceDetailsFormatterState();


  @override

  List<Object> get props => [];

}


final class FetchedPlaceDetailsFormatterInitial
    extends FetchedPlaceDetailsFormatterState {}


final class FetchedPlaceDetailsFormatterSuccessfull
    extends FetchedPlaceDetailsFormatterState {}

