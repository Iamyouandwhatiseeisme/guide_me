// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:guide_me/presentation_layer/widgets/first_page_widgets/custom_bottom_navigatio_bar_widget.dart';

import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class AuthPage extends StatefulWidget {
  final String apiKey;
  final CustomBottomNavigationBar bottomNavigationBar;
  const AuthPage(
      {super.key, required this.apiKey, required this.bottomNavigationBar});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return LoginPageWIdget(
      apiKey: widget.apiKey,
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}
