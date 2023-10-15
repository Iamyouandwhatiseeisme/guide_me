import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class BuildDialogForCollectionsPage extends BuildADialogOnMapsWindowWidget {
  final NearbyPlacesModel placeToAdd;
  const BuildDialogForCollectionsPage(
      {super.key, required super.textLabel,
      required super.iconToDisplay,
      required super.screenHeight,
      required super.screenWidth,
      required super.apiKey,
      required this.placeToAdd,
      super.lat,
      super.lon});
}
