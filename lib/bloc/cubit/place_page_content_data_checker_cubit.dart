import 'package:bloc/bloc.dart';


import 'package:equatable/equatable.dart';


part 'place_page_content_data_checker_state.dart';


class PlacePageContentDataCheckerCubit

    extends Cubit<PlacePageContentDataCheckerState> {

  PlacePageContentDataCheckerCubit()

      : super(PlacePageContentDataCheckerInitial());


  void placePageLoading() {

    emit(PlacePageContentDataCheckerLoading());

  }


  void placePageReady() {

    emit(PlacePageContentDataCheckerLoaded());

  }


  void placePageError(String message) {

    emit(PlacePageContentDataCheckerError(message));

  }

}

