import 'package:bloc/bloc.dart';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

part 'geolocator_state.dart';

abstract class LocationEvent {}

class GetLocation extends LocationEvent {}

class GeolocatorCubit extends Cubit<LocationState> {
  GeolocatorCubit() : super(LocationLoading());

  void getLocation() async {
    PermissionStatus status = await Permission.location.request();

    if (status.isGranted) {
      print('PermissonGranted');
      // Permission granted, proceed to get location

      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        emit(LocationLoaded(position));
        print(position.latitude);
        print(position.longitude);
      } catch (e) {
        emit(LocationErorr("Error getting location: $e"));
      }
    } else {}
  }
}
