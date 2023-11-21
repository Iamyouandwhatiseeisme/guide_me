import 'package:bloc/bloc.dart';
import 'category_button_state.dart'; // Import the CategoryCubitState

class CategoryCubit extends Cubit<CategoryCubitState> {
  CategoryCubit() : super(CategoryCubitState('Grocery'));

  void updateCategory(String category) {
    emit(CategoryCubitState(category));
  }
}
