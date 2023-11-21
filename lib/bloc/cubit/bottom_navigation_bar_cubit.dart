import 'package:bloc/bloc.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottomNavigationBarState(0));
  void changeTab(int index) {
    emit(BottomNavigationBarState(index));
  }
}
