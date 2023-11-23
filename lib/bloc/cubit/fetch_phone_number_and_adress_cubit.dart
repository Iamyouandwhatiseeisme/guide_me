import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/main.dart';

part 'fetch_phone_number_and_adress_state.dart';

class FetchPhoneNumberAndAdressCubit
    extends Cubit<FetchPhoneNumberAndAdressState> {
  FetchPhoneNumberAndAdressCubit() : super(FetchPhoneNumberAndAdressInitial());
  bool numberAndAdressFetched = false;
  final googleDataSource = sl.get<GoogleDataSource>();
  void fetchMoreDetails({
    required String placeId,
  }) async {
    try {
      if (!numberAndAdressFetched) {
        emit(FetchPhoneNumberAndAdressLoading());

        final placeDetailsJson = await googleDataSource.fetchDetails(
          placeId,
        );

        PlaceDetails placedetails = PlaceDetails.fromJson(placeDetailsJson);
        placedetails = PlaceDetails(
            adress: correctFormattedAdress(placedetails.adress),
            number: placedetails.number,
            openHour: placedetails.openHour,
            closeHour: placedetails.closeHour);

        emit(FetchPhoneNumberAndAdressLoaded(placedetails));

        numberAndAdressFetched = true;
      }
    } catch (error) {
      emit(FetchPhonenumberAndAdressError(
          errorMessage: 'Failed to fetch adress and number $error'));
    }
  }

  String? correctFormattedAdress(String? adress) {
    int index = 0;
    if (adress != null && adress.contains(',')) {
      index = adress.indexOf(',');
      adress = adress.substring(0, index);
    }

    return adress;
  }
}
