part of 'fetch_phone_number_and_adress_cubit.dart';

sealed class FetchPhoneNumberAndAdressState extends Equatable {
  const FetchPhoneNumberAndAdressState();

  @override
  List<Object> get props => [];
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

class FetchPhoneNumberAndAdressInitial extends FetchPhoneNumberAndAdressState {}

class FetchPhoneNumberAndAdressLoading extends FetchPhoneNumberAndAdressState {}

class FetchPhoneNumberAndAdressLoaded extends FetchPhoneNumberAndAdressState {
  // final Map<String?, String?> numberAndAdressByPlaceId;
  final PlaceDetails placeDetails;

  const FetchPhoneNumberAndAdressLoaded(this.placeDetails);
  @override
  List<Object> get props => [placeDetails];
}

class FetchPhonenumberAndAdressError extends FetchPhoneNumberAndAdressState {
  final String errorMessage;
  const FetchPhonenumberAndAdressError({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}
