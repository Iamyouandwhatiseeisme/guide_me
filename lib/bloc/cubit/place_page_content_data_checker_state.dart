part of 'place_page_content_data_checker_cubit.dart';


sealed class PlacePageContentDataCheckerState extends Equatable {

  const PlacePageContentDataCheckerState();


  @override

  List<Object> get props => [];

}


final class PlacePageContentDataCheckerInitial

    extends PlacePageContentDataCheckerState {}


final class PlacePageContentDataCheckerLoaded

    extends PlacePageContentDataCheckerState {}


final class PlacePageContentDataCheckerLoading

    extends PlacePageContentDataCheckerState {}


final class PlacePageContentDataCheckerError

    extends PlacePageContentDataCheckerState {

  final String errorMessage;


  const PlacePageContentDataCheckerError(this.errorMessage);


  @override

  List<Object> get props => [errorMessage];

}

