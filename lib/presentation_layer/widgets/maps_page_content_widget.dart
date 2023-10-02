import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MapsPageContent extends StatelessWidget {
  const MapsPageContent({
    super.key,
    required this.screenHeight,
    required GoogleMapController? controller,
    required this.lat,
    required this.lon,
    required this.screenWidth,
  }) : _controller = controller;

  final double screenHeight;
  final GoogleMapController? _controller;
  final double lat;
  final double lon;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2)),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingAnimationWidget.inkDrop(
                color: const Color(0xffC75E6B), size: 20);
          } else if (snapshot.hasError) {
            return ErrorWidget('No Controller available');
          } else {
            return Positioned(
                bottom: screenHeight / 4.25,
                left: 16,
                right: 16,
                child: Column(
                  children: [
                    MapsToolbarWIthDirectionsLocationAndThreeDotsWidget(
                      controller: _controller,
                      userLocation: LatLng(lat, lon),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomMapsTextField(screenWidth: screenWidth),
                    SizedBox(
                      height: 12,
                    ),
                    MapsTypesRowWidget(numOfItems: 3, screenWidth: screenWidth)
                  ],
                ));
          }
        });
  }
}
