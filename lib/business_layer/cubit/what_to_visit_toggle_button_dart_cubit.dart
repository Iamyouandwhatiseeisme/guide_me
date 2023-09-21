import 'package:bloc/bloc.dart';

part 'what_to_visit_toggle_button_dart_state.dart';

class WhatToVisitToggleButtonCubit
    extends Cubit<WhatToVisitToggleButtonCubitInitial> {
  WhatToVisitToggleButtonCubit()
      : super(WhatToVisitToggleButtonCubitInitial(value: 0));
  void selectRadioButton(int currentValue) {
    emit(WhatToVisitToggleButtonCubitInitial(value: currentValue));
  }
}
