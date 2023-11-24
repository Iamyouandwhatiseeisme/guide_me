// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:guide_me/bloc/cubits.dart';

import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../data/data.dart';

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
  // final googleApiClient = sl<GoogleDataSource>();

  PlaceDetails? placeDetails;
  String apiKey = dotenv.env['GOOGLE_API_KEY']!;
  @override
  Widget build(BuildContext context) {
    final String open = AppLocalizations.of(context)!.openNow;
    final String closed = AppLocalizations.of(context)!.closed;
    final String noInfo = AppLocalizations.of(context)!.noInformation;
    final placePagePayLoad =
        ModalRoute.of(context)!.settings.arguments as PlacePagePayLoad;

    final passedModel = placePagePayLoad.model;

    String userRatingTotal = passedModel.userRatingsTotal.toString();
    String transformedUserRatingTotal =
        '${userRatingTotal.substring(0, 1)},${userRatingTotal.substring(1)}';
    String typesInString =
        passedModel.types[0].toString().substring(0, 1).toUpperCase() +
            passedModel.types[0].toString().substring(1);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PhotosByPlaceIdFetcherCubit()),
        BlocProvider(create: (context) => WriteAReviewCubit()),
        BlocProvider(create: (context) => FetchPhoneNumberAndAdressCubit()),
        BlocProvider(create: (context) => MakeACallCubit()),
        BlocProvider(create: (context) => OpenLocationOnMapCubit()),
        BlocProvider(create: (context) => PlacePageContentDataCheckerCubit()),
        BlocProvider(
            create: (context) =>
                PlaceOpenStatuslabelCubit(open, closed, noInfo))
      ],
      child: Builder(
        builder: (context) {
          return MultiBlocListener(
            listeners: [
              BlocListener<PhotosByPlaceIdFetcherCubit,
                  PhotosByPlaceIdFetcherState>(
                listener: (context, state) {
                  if (state is PhotosByPlaceIdFetcherReadyToFetch) {
                    final photosByPlaceIdFetchedCubit =
                        context.read<PhotosByPlaceIdFetcherCubit>();
                    photosByPlaceIdFetchedCubit.fetchPhotos(
                      placeId: passedModel.placeId,
                    );
                    BlocProvider.of<PlacePageContentDataCheckerCubit>(context)
                        .placePageLoading();
                  } else if (state is PhotosByPlaceIdFetcherLoaded) {
                    final numberAndAdressFetcherCubit =
                        context.read<FetchPhoneNumberAndAdressCubit>();
                    numberAndAdressFetcherCubit.fetchMoreDetails(
                        placeId: passedModel.placeId);
                  } else if (state is PhotosByPlaceIdFetcherError) {
                    BlocProvider.of<PlacePageContentDataCheckerCubit>(context)
                        .placePageError(state.errorMessage);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.errorMessage),
                      ),
                    );
                  }
                },
              ),
              BlocListener<FetchPhoneNumberAndAdressCubit,
                  FetchPhoneNumberAndAdressState>(listener: (context, state) {
                if (state is FetchPhoneNumberAndAdressLoaded) {
                  placeDetails = state.placeDetails;
                  BlocProvider.of<PlaceOpenStatuslabelCubit>(context)
                      .initalize();
                }
              }),
              BlocListener<PlaceOpenStatuslabelCubit,
                  PlaceOpenStatusLabelState>(listener: (context, state) {
                if (state is PlaceOpenStatusReadyToFetch) {
                  final placeOpenStatusCubit =
                      context.read<PlaceOpenStatuslabelCubit>();

                  placeOpenStatusCubit.updateOpenStatus(passedModel.openNow);
                  BlocProvider.of<PlacePageContentDataCheckerCubit>(context)
                      .placePageReady();
                }
              }),
            ],
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(48),
                child: PlacePageAppbar(
                  placeToDisplay: passedModel,
                ),
              ),
              body: Builder(
                builder: (context) {
                  BlocProvider.of<PhotosByPlaceIdFetcherCubit>(context)
                      .initialize();
                  return BlocBuilder<PlacePageContentDataCheckerCubit,
                      PlacePageContentDataCheckerState>(
                    builder: (context, state) {
                      if (state is PlacePageContentDataCheckerLoaded) {
                        return PlacePageContent(
                          placeDetails: placeDetails!,
                          passedPlace: passedModel,
                          userRatingTotal: userRatingTotal,
                          transformedUserRatingTotal:
                              transformedUserRatingTotal,
                          typesInString: typesInString,
                        );
                      } else if (state is PlacePageContentDataCheckerLoading) {
                        return const LoadingAnimationScaffold();
                      } else if (state is PlacePageContentDataCheckerError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorMessage),
                          ),
                        );
                        return Scaffold(
                          body: Center(child: Text(state.errorMessage)),
                        );
                      } else {
                        return const LoadingAnimationScaffold();
                      }
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
