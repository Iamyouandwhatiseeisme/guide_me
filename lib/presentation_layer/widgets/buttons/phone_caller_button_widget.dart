// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubit/fetch_phone_number_and_adress_cubit.dart';
import 'package:guide_me/business_layer/cubit/make_a_call_cubit.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class PhoneCallerWidget extends StatelessWidget {
  final String apiKey;
  const PhoneCallerWidget({
    Key? key,
    required this.apiKey,
    required this.passedPlace,
  }) : super(key: key);

  final NearbyPlacesModel passedPlace;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchPhoneNumberAndAdressCubit,
        FetchPhoneNumberAndAdressState>(
      builder: (context, numberAndAdressState) {
        final numberAndAdressFetcherCubit =
            context.read<FetchPhoneNumberAndAdressCubit>();
        numberAndAdressFetcherCubit.fetchMoreDetails(
            passedPlace.placeId, apiKey);

        return BlocBuilder<MakeACallCubit, bool>(
          builder: (context, callReview) {
            String? number = '';
            String? adress = '';
            if (numberAndAdressState is FetchPhoneNumberAndAdressLoaded) {
              final adressAndNumber =
                  numberAndAdressState.numberAndAdressByPlaceId;
              number = adressAndNumber['phone'];
              adress = adressAndNumber['addres'];
            }
            return Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                  onTap: () {
                    context.read<MakeACallCubit>().makePhoneCall(number!);
                  },
                  child: TextWithUnderLine(
                    textToDisplay: 'Call',
                    color: const Color(0xff292F32).withOpacity(0.75),
                  )),
            );
          },
        );
      },
    );
  }
}
