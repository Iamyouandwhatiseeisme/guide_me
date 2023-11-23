import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubit/fetched_place_details_formatter_cubit.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/presentation/widgets/navigation/navigator_client.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

class SearchPageGridView extends StatelessWidget {
  const SearchPageGridView({
    super.key,
    required this.listTobuild,
    required this.distanceMap,
  });

  final List<NearbyPlacesModel>? listTobuild;
  final Map<NearbyPlacesModel, double?> distanceMap;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchedPlaceDetailsFormatterCubit(),
      child: Expanded(
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.50),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                final placePagePayload =
                    PlacePagePayLoad(model: listTobuild![index]);
                Navigator.pushNamed(
                  context,
                  NavigatorClient.placePage,
                  arguments: placePagePayload,
                );
              },
              child: SightseeingsPlaceCard(
                place: listTobuild![index],
                distance: distanceMap[listTobuild![index]],
              ),
            );
          },
          itemCount: listTobuild!.length,
        ),
      ),
    );
  }
}
