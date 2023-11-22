import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'change_name_state.dart';

class ChangeNameCubit extends Cubit<String> {
  ChangeNameCubit() : super((''));

  void changeName(String name) {
    print(name);
    emit(name);
  }
}
