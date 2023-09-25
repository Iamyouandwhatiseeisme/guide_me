import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';

import '../../business_layer/cubit/open_location_on_map_cubit.dart';
import 'text_with_underline_grey_widget.dart';

class AdressLabelAndOpenInMapButtonRowWIdget extends StatelessWidget {
  const AdressLabelAndOpenInMapButtonRowWIdget({
    super.key,
    required this.adress,
    required this.passedPlace,
  });

  final String? adress;
  final NearbyPlacesModel passedPlace;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            adress!,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          BlocBuilder<OpenLocationOnMapCubit, bool>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  final openLocationCubit =
                      context.read<OpenLocationOnMapCubit>();
                  openLocationCubit.openInMap(passedPlace.name, adress);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: TextWithUnderLine(textToDisplay: 'See on Map'),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

String? correctFormattedAdress(String? adress) {
  int index = 0;
  if (adress != null && adress.contains(',')) {
    index = adress.indexOf(',');
    adress = adress.substring(0, index);
  }

  return adress;
}
