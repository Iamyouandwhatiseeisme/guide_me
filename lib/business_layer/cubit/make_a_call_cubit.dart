import 'package:bloc/bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:url_launcher/url_launcher_string.dart';

class MakeACallCubit extends Cubit<bool> {
  MakeACallCubit() : super(false);

  Future<void> makePhoneCall(String phoneNumber) async {
    final phoneCallUrl = 'tel:$phoneNumber';
    final uri = Uri.parse(phoneCallUrl);
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
