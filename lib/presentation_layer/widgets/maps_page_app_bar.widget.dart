import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../pages/maps_page.dart';

class MapsPageAppBarWidget extends StatelessWidget {
  const MapsPageAppBarWidget({
    super.key,
    required this.widget,
  });

  final MapsPage widget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leadingWidth: 250,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: LocationDisplayWidget(apiKey: widget.apiKey!),
      ),
    );
  }
}
