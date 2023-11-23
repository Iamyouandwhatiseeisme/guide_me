import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubits.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/presentation/pages/first_page/widgets/sightseeings_place_card.wiget.dart';
import 'package:guide_me/presentation/widgets/navigation/navigator_client.dart';
import 'package:guide_me/presentation/widgets/page_payloads/place_page_payload.dart';

class SeeAllPageGridView extends StatelessWidget {
  const SeeAllPageGridView({
    super.key,
    required this.listTobuild,
    required this.distanceMap,
  });

  final List<NearbyPlacesModel>? listTobuild;
  final Map<NearbyPlacesModel, double?> distanceMap;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchPhoneNumberAndAdressCubit(),
      child: SizedBox(
        height: 1000,
        width: 460,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.70),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                final placePagePayLoad =
                    PlacePagePayLoad(model: listTobuild![index]);
                Navigator.pushNamed(
                  context,
                  NavigatorClient.placePage,
                  arguments: placePagePayLoad,
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
