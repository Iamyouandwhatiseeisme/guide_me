
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:url_launcher/url_launcher.dart';

part 'open_location_on_map_state.dart';

class OpenLocationOnMapCubit extends Cubit<bool> {
  OpenLocationOnMapCubit() : super(false);

  Future<void> openInMap(String? name, String? adress) async {
    final String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$name,$adress';
    final uri = Uri.parse(googleMapsUrl);
    print(uri);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
        emit(true); // Indicate that the phone call was initiated successfully
      } else {
        emit(false); // Indicate that the phone call could not be initiated
      }
    } catch (e) {
      emit(
          false); // Handle exceptions and indicate that the phone call could not be initiated
    }
  }
}
