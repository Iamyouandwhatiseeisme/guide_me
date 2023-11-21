import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guide_me/data/data.dart';

part 'fetch_phone_number_and_adress_state.dart';

class FetchPhoneNumberAndAdressCubit
    extends Cubit<FetchPhoneNumberAndAdressState> {
  FetchPhoneNumberAndAdressCubit() : super(FetchPhoneNumberAndAdressInitial());
  bool numberAndAdressFetched = false;

  void fetchMoreDetails(
      {required String placeId,
      required GoogleApiClient googleApiClient}) async {
    try {
      if (!numberAndAdressFetched) {
        emit(FetchPhoneNumberAndAdressLoading());

        final fetchedNumberAndAdressByPlaceId =
            await googleApiClient.fetchDetails(
          placeId,
        );

        final adress =
            correctFormattedAdress(fetchedNumberAndAdressByPlaceId['adress']);
        final number = fetchedNumberAndAdressByPlaceId['phone'];

        final openHour = fetchedNumberAndAdressByPlaceId['open_hour'];
        final closeHour = fetchedNumberAndAdressByPlaceId['close_hour'];
        final placedetails = PlaceDetails(
          openHour: openHour,
          closeHour: closeHour,
          adress: adress,
          number: number,
        );

        emit(FetchPhoneNumberAndAdressLoaded(placedetails));

        numberAndAdressFetched = true;
      }
    } catch (error) {
      emit(FetchPhonenumberAndAdressError(
          errorMessage: 'Failed to fetch adress and number $error'));
    }
  }
}
