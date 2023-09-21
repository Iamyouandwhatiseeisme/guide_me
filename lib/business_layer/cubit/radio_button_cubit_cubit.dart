import 'package:flutter_bloc/flutter_bloc.dart';

part 'radio_button_cubit_state.dart';

class RadioButtonCubitCubit extends Cubit<RadioButtonCubitInitial> {
  RadioButtonCubitCubit() : super(RadioButtonCubitInitial(value: 0));
  void selectRadioButton(int currentValue) {
    emit(RadioButtonCubitInitial(value: currentValue));
  }
}
