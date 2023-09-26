import 'package:bloc/bloc.dart';

part 'sorter_togge_button_state.dart';

class SorterToggleButtonCubit extends Cubit<SorterToggleButtonInitial> {
  SorterToggleButtonCubit() : super(SorterToggleButtonInitial(value: 0));
  void selectRadioButton(int currentValue) {
    emit(SorterToggleButtonInitial(value: currentValue));
  }
}
