import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationCubit extends Cubit<LatLng> {
  LocationCubit() : super(LatLng(0.0, 0.0));

  void goToMyLocation(
      GoogleMapController? controller, LatLng myLocation) async {
    try {
      if (controller != null) {
        _goToMyLocation(controller, myLocation);
        emit(myLocation);
      }
    } catch (e) {
      // Handle any errors that may occur while getting the user's location.
      print('Error getting user location: $e');
    }
  }
}

void _goToMyLocation(GoogleMapController _controller, LatLng myLocation) async {
  // Implement logic to move the camera to the user's location
  // For example:

  _controller.animateCamera(CameraUpdate.newLatLng(myLocation));
}
