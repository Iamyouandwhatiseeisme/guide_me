// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/data/data.dart';

import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

class FirstPageAppBar extends StatelessWidget {
  const FirstPageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      leadingWidth: 250,
      actions: [
        const LanguageDropDownMenuWidget(),
        IconButton(
          icon: const Icon(Icons.brightness_4), // Icon for theme toggle
          onPressed: () {
            context.read<ThemeProvider>().toggleTheme();
          },
        ),
      ],
      leading: const Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: LocationDisplayWidget(),
      ),
    );
  }
}
