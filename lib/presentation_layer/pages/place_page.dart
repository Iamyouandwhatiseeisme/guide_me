// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubit/photos_by_place_id_fetcher_cubit.dart';
import 'package:guide_me/business_layer/cubit/write_a_review_cubit.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:guide_me/presentation_layer/widgets/star_rating_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    final passedPlace =
        ModalRoute.of(context)!.settings.arguments as NearbyPlacesModel;
    String userRatingTotal = passedPlace.userRatingsTotal.toString();
    String transformedUserRatingTotal =
        '${userRatingTotal.substring(0, 1)},${userRatingTotal.substring(1)}';

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PhotosByPlaceIdFetcherCubit(),
        ),
        BlocProvider(
          create: (context) => WriteAReviewCubit(),
        ),
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
            appBar: AppBar(
              actions: const [
                Icon(Icons.share_outlined),
                SizedBox(width: 24),
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.favorite_border),
                )
              ],
              backgroundColor: const Color(0xffF3F0E6),
            ),
            backgroundColor: const Color(0xffF3F0E6),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PhotoListViewBuilder(),
                NameOfThePlaceLabel(passedPlace: passedPlace),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TransformedUserRatingWIdget(
                        passedPlace: passedPlace,
                        userRatingTotal: userRatingTotal,
                        transformedUserRatingTotal: transformedUserRatingTotal),
                    BlocBuilder<WriteAReviewCubit, bool>(
                      builder: (context, reviewed) {
                        return GestureDetector(
                          onTap: () {
                            context
                                .read<WriteAReviewCubit>()
                                .openGoogleMapsReview(passedPlace.placeId);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: TextWithUnderLine(
                              textToDisplay: 'Write a review',
                            ),
                          ),
                        );
                      },
                    )
                  ],
                )
              ],
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
