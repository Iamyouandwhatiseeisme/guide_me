import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'place_open_status_state.dart';

class PlaceOpenStatuslabelCubit extends Cubit<PlaceOpenStatusLabelState> {
  PlaceOpenStatuslabelCubit(this.appLocalizations)
      : super(PlaceOpenStatusInitial());
  final AppLocalizations appLocalizations;

  String? openNow;
  String? closed;
  String? noInfo;

  void initalize() {
    openNow = appLocalizations.openNow;
    closed = appLocalizations.closed;
    noInfo = appLocalizations.noInformation;
    emit(PlaceOpenStatusReadyToFetch());
  }

  void updateOpenStatus(bool? isOpenNow) {
    if (isOpenNow == true) {
      emit(OpenNowState(openNow!));
    } else if (isOpenNow == false) {
      emit(ClosedState(closed!));
    } else {
      emit(ErrorState(noInfo!));
    }
  }
}
