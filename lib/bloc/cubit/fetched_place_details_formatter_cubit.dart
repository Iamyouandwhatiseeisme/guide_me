import 'package:bloc/bloc.dart';


import 'package:equatable/equatable.dart';


import 'package:guide_me/data/data.dart';


part 'fetched_place_details_formatter_state.dart';


class FetchedPlaceDetailsFormatterCubit

    extends Cubit<FetchedPlaceDetailsFormatterState> {

  FetchedPlaceDetailsFormatterCubit()

      : super(FetchedPlaceDetailsFormatterInitial());


  String createListOfTypes(

      {required int index,

      required String type,

      required NearbyPlacesModel place}) {

    if (index < place.types.length - 1) {

      type =

          "${place.types[index].toString()[0].toUpperCase()}${place.types[index].toString().substring(1)}, ";


      type = swapUnderScoreWithSpace(type);

    } else {

      type =

          "${place.types.last.toString()[0].toUpperCase()}${place.types.last.toString().substring(1)}";


      type = swapUnderScoreWithSpace(type);

    }


    emit(FetchedPlaceDetailsFormatterSuccessfull());


    return type;

  }


  String swapUnderScoreWithSpace(String type) {

    if (type.contains('_')) {

      type = type.replaceAll('_', ' ');

    }


    return type;

  }

}

