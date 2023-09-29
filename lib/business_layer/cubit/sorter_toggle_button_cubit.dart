import 'package:bloc/bloc.dart';

part 'sorter_togge_button_state.dart';

class SorterToggleButtonCubit extends Cubit<SortertoggleButtonState> {
  SorterToggleButtonCubit() : super(SortertoggleButtonState(value: 0));
  void selectRadioButton(int currentValue) {
    emit(SortertoggleButtonState(value: currentValue));
  }
}
