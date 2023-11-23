// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubits.dart';

import 'package:guide_me/data/data.dart';

import 'package:guide_me/presentation/widgets/page_payloads/searches_page_payload.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

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
    final searchesPagePayload =
        ModalRoute.of(context)!.settings.arguments as SearchesPagePayload;
    listTobuild = searchesPagePayload.listToBuild;
    fetchSearchedItemsCubit = searchesPagePayload.fetchSearchedItemsCubit;

    final userLocation = searchesPagePayload.userLocation;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SortingCubit()),
        BlocProvider(create: (context) => SorterToggleButtonCubit()),
        BlocProvider.value(
          value: fetchSearchedItemsCubit!,
        ),
      ],
      child: BlocBuilder<SortingCubit, SortingState>(
        builder: (context, sightSeeingSorterstate) {
          return BlocBuilder<SorterToggleButtonCubit, SortertoggleButtonState>(
            builder: (context, sorterState) {
              return Builder(builder: (context) {
                BlocProvider.of<SortingCubit>(context).sortList(
                    unsortedList: listTobuild!,
                    sortingOption: sorterState.value,
                    userLocation: userLocation,
                    distanceMap: distanceMap);

                return BlocBuilder<FetchSearchedItemsCubit,
                    FetchSearchedItemsState>(builder: (context, state) {
                  if (state is FetchSearchedItemsLoaded) {
                    if (sightSeeingSorterstate is SortingLoaded) {
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
                                    SorterRadioButtonWidget(state: sorterState),
                                    SearchPageGridView(
                                        listTobuild: listTobuild,
                                        distanceMap: distanceMap),
                                  ],
                                ),
                              ),
                            ));
                      });
                    } else {
                      return const LoadingAnimationScaffold();
                    }
                  } else if (state is FetchSearchedItemsLoading) {
                    return const LoadingAnimationScaffold();
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
