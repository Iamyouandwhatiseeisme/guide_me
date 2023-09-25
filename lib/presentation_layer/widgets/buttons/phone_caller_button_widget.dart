import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubit/fetch_phone_number_and_adress_cubit.dart';
import 'package:guide_me/business_layer/cubit/make_a_call_cubit.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class PhoneCallerWidget extends StatelessWidget {
  const PhoneCallerWidget({
    super.key,
    required this.passedPlace,
  });

  final NearbyPlacesModel passedPlace;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchPhoneNumberAndAdressCubit,
        FetchPhoneNumberAndAdressState>(
      builder: (context, numberAndAdressState) {
        final numberAndAdressFetcherCubit =
            context.read<FetchPhoneNumberAndAdressCubit>();
        numberAndAdressFetcherCubit.fetchNumberAndAdress(passedPlace.placeId);

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
                  child: const TextWithUnderLine(textToDisplay: 'Call')),
            );
          },
        );
      },
    );
  }
}
