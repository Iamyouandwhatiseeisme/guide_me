// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubits.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/main.dart';
import 'package:guide_me/presentation/pages/first_page/widgets/custom_bottom_navigatio_bar_widget.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  late List<NearbyPlacesModel> listOfPlaces = [];
  Map<NearbyPlacesModel, double?> distanceMap = {};

  bool isLoading = false;
  final bottomNavigationBar = sl.get<CustomBottomNavigationBar>();

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<NearbyPlacesModel>("FavoritedPlaces");
    final listOfFavorites = box.toMap().values.toList();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BookmarksTabCubit(),
        ),
        BlocProvider(
          create: (context) => SortingCubit(),
        ),
        BlocProvider(
          create: (context) => BoxManagamentCubit(listOfFavorites),
        ),
      ],
      child: Builder(builder: (context) {
        final sortingCubit = BlocProvider.of<SortingCubit>(context);
        return Scaffold(
          bottomNavigationBar: bottomNavigationBar,
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: BookmarkPageAppbar(),
          ),
          body: Builder(builder: (context) {
            sortingCubit.createDistanceMap(
              distanceMap: distanceMap,
              listOfDestinations: listOfFavorites,
            );

            return BlocBuilder<BoxManagamentCubit, BoxManagamentState>(
              builder: (context, state) {
                final listTopass = state.listOfFavorites;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const BookmarksPageTabOptionsButtons(),
                    BookmarksPageContent(
                        listOfFavorites: listTopass,
                        widget: widget,
                        box: box,
                        distanceMap: distanceMap),
                    const BookmarksPageBottomLabelAndButtonBuilder()
                  ],
                );
              },
            );
          }),
        );
      }),
    );
  }
}
