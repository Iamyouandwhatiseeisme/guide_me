import 'package:bloc/bloc.dart';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

part 'geolocator_state.dart';

abstract class LocationEvent {}

class GetLocation extends LocationEvent {}

class GeolocatorCubit extends Cubit<LocationState> {
  GeolocatorCubit() : super(LocationLoading());

  bool locationLoaded = false;

  void getLocation() async {
    PermissionStatus status = await Permission.location.request();

    if (status.isGranted) {
      // Permission granted, proceed to get location

      try {
        if (!locationLoaded) {
          Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high);

          emit(LocationLoaded(position));
          locationLoaded = true;
        }
      } catch (e) {
        emit(LocationErorr("Error getting location: $e"));
      }
    } else {}
  }
}
