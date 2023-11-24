import 'package:bloc/bloc.dart';
import 'package:guide_me/data/data.dart';

part 'sorter_togge_button_state.dart';

class SorterToggleButtonCubit extends Cubit<SorterToggleButtonState> {
  SorterToggleButtonCubit()
      : super(SorterToggleButtonState(sorterState: SortingOption.byRating));

  void selectRadioButton(SortingOption sortingOption) {
    emit(SorterToggleButtonState(sorterState: sortingOption));
  }
}
