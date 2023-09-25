// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubit/fetch_phone_number_and_adress_cubit.dart';
import 'package:guide_me/business_layer/cubit/make_a_call_cubit.dart';
import 'package:guide_me/business_layer/cubit/open_location_on_map_cubit.dart';

import 'package:guide_me/business_layer/cubit/photos_by_place_id_fetcher_cubit.dart';
import 'package:guide_me/business_layer/cubit/write_a_review_cubit.dart';
import 'package:guide_me/data_layer/data.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class PlacePage extends StatefulWidget {
  final NearbyPlacesModel? placeToDisplay;
  const PlacePage({
    Key? key,
    this.placeToDisplay,
  }) : super(key: key);

  @override
  State<PlacePage> createState() => _PlacepageState();
}

class _PlacepageState extends State<PlacePage> {
  bool photosFetched = false;
  String? adress = '';
  String? number = '';
  @override
  Widget build(BuildContext context) {
    final passedPlace =
        ModalRoute.of(context)!.settings.arguments as NearbyPlacesModel;
    String userRatingTotal = passedPlace.userRatingsTotal.toString();
    String transformedUserRatingTotal =
        '${userRatingTotal.substring(0, 1)},${userRatingTotal.substring(1)}';
    String typesInString =
        passedPlace.types[0].toString().substring(0, 1).toUpperCase() +
            passedPlace.types[0].toString().substring(1);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PhotosByPlaceIdFetcherCubit(),
        ),
        BlocProvider(
          create: (context) => WriteAReviewCubit(),
        ),
        BlocProvider(create: (context) => FetchPhoneNumberAndAdressCubit()),
        BlocProvider(create: (context) => MakeACallCubit()),
        BlocProvider(create: (context) => OpenLocationOnMapCubit())
      ],
      child:
          BlocBuilder<PhotosByPlaceIdFetcherCubit, PhotosByPlaceIdFetcherState>(
              builder: (context, photosState) {
        if (!photosFetched) {
          final photosByPlaceIdFetchedCubit =
              context.read<PhotosByPlaceIdFetcherCubit>();
          photosByPlaceIdFetchedCubit.fetchPhotos(passedPlace.placeId);
        }
        if (photosState is PhotosByPlaceIdFetcherLoaded) {
          return Scaffold(
            appBar: const PreferredSize(
                preferredSize: Size.fromHeight(48), child: PlacePageAppbar()),
            backgroundColor: const Color(0xffF3F0E6),
            body: BlocBuilder<FetchPhoneNumberAndAdressCubit,
                FetchPhoneNumberAndAdressState>(
              builder: (context, numberAndAdressState) {
                final numberAndAdressFetcherCubit =
                    context.read<FetchPhoneNumberAndAdressCubit>();
                numberAndAdressFetcherCubit
                    .fetchNumberAndAdress(passedPlace.placeId);

                if (numberAndAdressState is FetchPhoneNumberAndAdressLoaded) {
                  final adressAndNumber =
                      numberAndAdressState.numberAndAdressByPlaceId;
                  number = adressAndNumber['phone'];
                  adress = correctFormattedAdress(adressAndNumber['adress']);
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PhotoListViewBuilder(),
                    NameOfThePlaceLabel(passedPlace: passedPlace),
                    const SizedBox(
                      height: 18,
                    ),
                    RatingAndReviewRowWidget(
                        passedPlace: passedPlace,
                        userRatingTotal: userRatingTotal,
                        transformedUserRatingTotal: transformedUserRatingTotal),
                    TypesLabelAndMakeACallButtonWidgetRow(
                        typesInString: typesInString, number: number),
                    AdressLabelAndOpenInMapButtonRowWIdget(
                        adress: adress, passedPlace: passedPlace)
                  ],
                );
              },
            ),
          );
        } else if (photosState is PhotosByPlaceIdFetcherLoading) {
          return const CircularProgressIndicator();
        } else if (photosState is PhotosByPlaceIdFetcherInitial) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        } else {
          return const Text('NO PHOTOS');
        }
      }),
    );
  }
}
