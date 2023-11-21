import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:guide_me/data/data.dart';

class LocationCubit extends Cubit<UserLocation> {
  LocationCubit() : super(UserLocation(userLat: 0.0, userLon: 0.0));

  void goToMyLocation(
      {GoogleMapController? controller,
      required UserLocation myLocation}) async {
    try {
      if (controller != null) {
        _goToMyLocation(controller, myLocation);
        emit(myLocation);
      }
    } catch (e) {
      // Handle any errors that may occur while getting the user's location.
      throw ('Error getting user location: $e');
    }
  }
}

void _goToMyLocation(
    GoogleMapController controller, UserLocation myLocation) async {
  // Implement logic to move the camera to the user's location
  // For example:
  final latLng = LatLng(myLocation.userLat, myLocation.userLon);

  controller.animateCamera(CameraUpdate.newLatLng(latLng));
}
