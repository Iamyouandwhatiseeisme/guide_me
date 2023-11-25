import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'place_open_status_state.dart';

class PlaceOpenStatuslabelCubit extends Cubit<PlaceOpenStatusLabelState> {
  PlaceOpenStatuslabelCubit(this.openNow, this.closed, this.noInfo)
      : super(PlaceOpenStatusInitial());
  final String openNow;
  final String closed;
  final String noInfo;

  void initalize() {
    emit(PlaceOpenStatusReadyToFetch());
  }

  void updateOpenStatus(bool? isOpenNow) {
    if (isOpenNow == true) {
      emit(OpenNowState(openNow));
    } else if (isOpenNow == false) {
      emit(ClosedState(closed));
    } else {
      emit(ErrorState(noInfo));
    }
  }
}
