import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../pages/maps_page.dart';

class FutureBuilderForMapsPageContent extends StatelessWidget {
  const FutureBuilderForMapsPageContent({
    super.key,
    required Completer<GoogleMapController> googleMapControllerCompleter,
    required this.widget,
    required this.screenHeight,
    required GoogleMapController? controller,
    required this.lat,
    required this.lon,
    required this.screenWidth,
  })  : _googleMapControllerCompleter = googleMapControllerCompleter,
        _controller = controller;

  final Completer<GoogleMapController> _googleMapControllerCompleter;
  final MapsPage widget;
  final double screenHeight;
  final GoogleMapController? _controller;
  final double lat;
  final double lon;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    if (!_googleMapControllerCompleter.isCompleted) {
      print('completed');
    }
    return FutureBuilder(
        future: _googleMapControllerCompleter.future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return MapsPageContent(
                  apiKey: widget.apiKey!,
                  screenHeight: screenHeight,
                  controller: _controller,
                  lat: lat,
                  lon: lon,
                  screenWidth: screenWidth);
            } else {
              return const Text('No data');
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: LoadingAnimationWidget.inkDrop(
                    color: const Color(0xffC75E6B), size: 20));
          } else {
            return const Text('Erro');
          }
        });
  }
}
