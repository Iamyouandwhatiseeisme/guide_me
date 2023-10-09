import 'package:bloc/bloc.dart';

enum TabOption { favorites, collections }

class BookmarksTabCubit extends Cubit<TabOption> {
  BookmarksTabCubit() : super(TabOption.favorites);

  void selectTab(TabOption tabOption) {
    emit(tabOption);
  }
}
