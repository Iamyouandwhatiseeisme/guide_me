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
        BlocProvider(
            create: (context) => SorterToggleButtonCubit()
              ..selectRadioButton(SortingOption.byRating)),
        BlocProvider.value(
          value: fetchSearchedItemsCubit!,
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<FetchSearchedItemsCubit, FetchSearchedItemsState>(
            listener: (context, state) {
              if (state is FetchSearchedItemsLoaded) {
                BlocProvider.of<SortingCubit>(context).sortList(
                    unsortedList: listTobuild!,
                    sortingOption: SortingOption.byRating,
                    userLocation: userLocation,
                    distanceMap: distanceMap);
              }
            },
          ),
          BlocListener<SorterToggleButtonCubit, SorterToggleButtonState>(
            listener: (context, sortingState) {
              final sortingCubit = BlocProvider.of<SortingCubit>(context);
              if (sortingState.sorterState == SortingOption.byRating) {
                sortingCubit.sortList(
                    unsortedList: listTobuild!,
                    sortingOption: sortingState.sorterState!,
                    userLocation: userLocation,
                    distanceMap: distanceMap);
              }
              if (sortingState.sorterState == SortingOption.byDistance) {
                sortingCubit.sortList(
                    unsortedList: listTobuild!,
                    sortingOption: sortingState.sorterState!,
                    userLocation: userLocation,
                    distanceMap: distanceMap);
              }
            },
          ),
        ],
        child: Builder(builder: (context) {
          return BlocBuilder<SortingCubit, SortingState>(
            builder: (context, sortingSatte) {
              return BlocBuilder<FetchSearchedItemsCubit,
                  FetchSearchedItemsState>(builder: (context, state) {
                if (state is FetchSearchedItemsLoaded) {
                  if (sortingSatte is SortingLoaded) {
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
                                  BlocBuilder<SorterToggleButtonCubit,
                                      SorterToggleButtonState>(
                                    builder: (context, state) {
                                      return SorterRadioButtonWidget(
                                          state: state);
                                    },
                                  ),
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
            },
          );
        }),
      ),
    );
  }
}
