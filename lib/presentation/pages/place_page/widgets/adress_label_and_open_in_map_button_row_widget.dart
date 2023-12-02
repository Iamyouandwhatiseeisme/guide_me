import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubits.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/presentation/widgets/buttons/text_button.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          SizedBox(
            width: 200,
            child: Text(
              adress!,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
          TextButton(
              onTap: () {
                context
                    .read<OpenLocationOnMapCubit>()
                    .openInMap(name: passedPlace.name, adress: adress);
              },
              label: AppLocalizations.of(context)!.seeOnMap)
        ],
      ),
    );
  }
}
