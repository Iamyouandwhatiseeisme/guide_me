import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'place_open_status_state.dart';

class PlaceOpenStatuslabelCubit extends Cubit<PlaceOpenStatusLabelState> {
  PlaceOpenStatuslabelCubit() : super(PlaceOpenStatusInitial());

  void updateOpenStatus(bool? isOpenNow) {
    if (isOpenNow == true) {
      emit(const OpenNowState('Open Now'));
    } else if (isOpenNow == false) {
      emit(const ClosedState('Closed'));
    } else {
      emit(const ErrorState('No Information'));
    }
  }
}
