// review_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:url_launcher/url_launcher_string.dart';

class WriteAReviewCubit extends Cubit<bool> {
  WriteAReviewCubit() : super(false);

  Future<void> openGoogleMapsReview(String placeId) async {
    final googleMapsReviewUrl =
        'https://search.google.com/local/writereview?placeid=$placeId';
    final writeReviewUrl = Uri.parse(googleMapsReviewUrl);
    print(writeReviewUrl);
    try {
      if (await canLaunchUrl(writeReviewUrl)) {
        await launchUrl(writeReviewUrl);
        emit(true); // Indicate that the operation was successful
      } else {
        emit(false); // Indicate that the operation failed
      }
    } catch (e) {
      emit(false); // Handle exceptions and indicate that the operation failed
    }
  }
}
