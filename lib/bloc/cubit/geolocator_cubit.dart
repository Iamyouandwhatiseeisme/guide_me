import 'package:bloc/bloc.dart';

import 'package:geolocator/geolocator.dart';
import 'package:guide_me/data/data.dart';
import 'package:permission_handler/permission_handler.dart';

part 'geolocator_state.dart';

abstract class LocationEvent {}

class GetLocation extends LocationEvent {}

class GeolocatorCubit extends Cubit<LocationState> {
  GeolocatorCubit() : super(LocationLoading());

  bool locationLoaded = false;

  Future registerLocation() async {
    PermissionStatus status = await Permission.location.request();
    UserLocation userLocation;

    if (status.isGranted) {
      // Permission granted, proceed to get location

      try {
        if (!locationLoaded) {
          Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high);

          userLocation = UserLocation(
              userLat: position.latitude, userLon: position.longitude);
          registerLocationSingleton(userLocation);
          emit(LocationLoaded(position));
          locationLoaded = true;
        }
      } catch (e) {
        emit(LocationErorr("Error getting location: $e"));
      }
    } else {}
  }
}
