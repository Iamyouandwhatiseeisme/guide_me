import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class IsExapndedCubit extends Cubit<bool> {
  IsExapndedCubit() : super(false);

  void toggleExpansion() {
    emit(!state);
  }
}
