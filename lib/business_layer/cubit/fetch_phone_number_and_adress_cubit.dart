import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guide_me/data_layer/data.dart';

part 'fetch_phone_number_and_adress_state.dart';

class FetchPhoneNumberAndAdressCubit
    extends Cubit<FetchPhoneNumberAndAdressState> {
  FetchPhoneNumberAndAdressCubit() : super(FetchPhoneNumberAndAdressInitial());
  bool numberAndAdressFetched = false;

  void fetchMoreDetails(String placeId, String apiKey) async {
    try {
      if (!numberAndAdressFetched) {
        emit(FetchPhoneNumberAndAdressLoading());

        final fetchedNumberAndAdressByPlaceId =
            await fetchDetails(placeId, apiKey);
        emit(FetchPhoneNumberAndAdressLoaded(fetchedNumberAndAdressByPlaceId));

        numberAndAdressFetched = true;
      }
    } catch (error) {
      emit(FetchPhonenumberAndAdressError(
          errorMessage: 'Failed to fetch adress and number $error'));
    }
  }
}
