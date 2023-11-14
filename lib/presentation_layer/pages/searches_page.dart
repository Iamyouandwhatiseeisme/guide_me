// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubit/fetch_searched_items_cubit.dart';
import 'package:guide_me/business_layer/cubits.dart';

import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/page_payloads/searches_page_payload.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../widgets/page_payloads/place_page_payload.dart';

class SearchesPage extends StatefulWidget {
  const SearchesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchesPage> createState() => _SearchesPageState();
}

class _SearchesPageState extends State<SearchesPage> {
  List<NearbyPlacesModel>? listTobuild;

  FetchSearchedItemsCubit? fetchSearchedItemsCubit;
  double? userLat;
  double? userLon;

  Map<NearbyPlacesModel, double?> distanceMap = {};

  @override
  Widget build(BuildContext context) {
    final passedPayload =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    final searchesPagePayload = passedPayload[0] as SearchesPagePayload;
    listTobuild = searchesPagePayload.listToBuild;
    fetchSearchedItemsCubit = searchesPagePayload.fetchSearchedItemsCubit;
    userLat = searchesPagePayload.userLat;
    userLon = searchesPagePayload.userLon;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SightseeingSortingCubit()),
        BlocProvider(create: (context) => SorterToggleButtonCubit()),
        BlocProvider.value(
          value: fetchSearchedItemsCubit!,
        ),
      ],
      child: BlocBuilder<SightseeingSortingCubit, SightseeingSortingState>(
        builder: (context, sightSeeingSorterstate) {
          return BlocBuilder<SorterToggleButtonCubit, SortertoggleButtonState>(
            builder: (context, sorterState) {
              return Builder(builder: (context) {
                BlocProvider.of<SightseeingSortingCubit>(context).sortList(
                    listTobuild!,
                    sorterState.value,
                    userLat!,
                    userLon!,
                    distanceMap);

                return BlocBuilder<FetchSearchedItemsCubit,
                    FetchSearchedItemsState>(builder: (context, state) {
                  if (state is FetchSearchedItemsLoaded) {
                    if (sightSeeingSorterstate is SightseeingsortingLoaded) {
                      return Builder(builder: (context) {
                        return Scaffold(
                            backgroundColor:
                                Theme.of(context).colorScheme.background,
                            appBar: AppBar(),
                            body: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: SizedBox(
                                height: 800,
                                width: 460,
                                child: Column(
                                  children: [
                                    SorterRadioButtonWidget(
                                        userLat: userLat!,
                                        userLon: userLon!,
                                        state: sorterState),
                                    Expanded(
                                      child: GridView.builder(
                                        shrinkWrap: true,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                childAspectRatio: 0.50),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              final placePagePayload =
                                                  PlacePagePayLoad(
                                                      model:
                                                          listTobuild![index]);
                                              Navigator.pushNamed(
                                                context,
                                                'placePage',
                                                arguments: [placePagePayload],
                                              );
                                            },
                                            child: SightseeingsPlaceCard(
                                              place: listTobuild![index],
                                              distance: distanceMap[
                                                  listTobuild![index]],
                                            ),
                                          );
                                        },
                                        itemCount: listTobuild!.length,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ));
                      });
                    } else {
                      return Scaffold(
                          body: Center(
                              child: LoadingAnimationWidget.inkDrop(
                                  color: Colors.red, size: 50)));
                    }
                  } else if (state is FetchSearchedItemsLoading) {
                    return Scaffold(
                      body: Center(
                          child: LoadingAnimationWidget.inkDrop(
                              color: Colors.red, size: 50)),
                    );
                  } else if (state is FetchSearchedItemsError) {
                    return Scaffold(
                      body: Center(
                        child: Text(state.errorMessage),
                      ),
                    );
                  } else {
                    return Scaffold(
                      appBar: AppBar(),
                      body: const Center(
                        child: Text('Couldn\'t load searches'),
                      ),
                    );
                  }
                });
              });
            },
          );
        },
      ),
    );
  }
}
