import 'package:bloc/bloc.dart';

class IsExapndedCubit extends Cubit<bool> {
  IsExapndedCubit() : super(false);

  void toggleExpansion() {
    emit(!state);
  }
}
