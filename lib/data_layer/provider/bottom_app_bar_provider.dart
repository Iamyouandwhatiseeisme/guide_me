import 'package:flutter/material.dart';

import '../../presentation_layer/widgets/first_page_widgets/custom_bottom_navigatio_bar_widget.dart';

class BottomAppBarProvider extends ChangeNotifier {
  late CustomBottomNavigationBar bottomAppBar;

  void setBottomAppBar(CustomBottomNavigationBar bottomAppBar) {
    this.bottomAppBar = bottomAppBar;
    notifyListeners();
  }
}
