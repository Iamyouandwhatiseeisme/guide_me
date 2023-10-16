import 'package:flutter/material.dart';
import 'package:guide_me/data_layer/data.dart';

import '../presentation_layer_widgets.dart';

class CardUiForBookmarksPage extends CardUi {
  final String apiKey;
  final Function onDelete;

  const CardUiForBookmarksPage(
      {super.key,
      required this.onDelete,
      required this.apiKey,
      required super.distance,
      required super.image,
      required super.place});

  @override
  Widget build(BuildContext context) {
    String userRatingTotal = place.userRatingsTotal.toString();
    String transformedUserRatingTotal =
        '${userRatingTotal.substring(0, 1)},${userRatingTotal.substring(1)}';

    String type = '';
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onLongPress: () => showDIalogWindow(
          context,
          screenHeight,
          screenWidth,
          const Icon(
            Icons.collections_rounded,
            color: Colors.white,
          ),
          'Add to collections',
          null,
          null,
          null,
          apiKey,
          place),
      onTap: () =>
          Navigator.pushNamed(context, 'placePage', arguments: [apiKey, place]),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(3)),
        width: 256,
        height: 113,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 96,
              width: 160,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          place.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 12),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          onDelete();
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.withOpacity(0.25)),
                            child: const Icon(Icons.close_outlined)),
                      )
                    ],
                  ),
                  if (place.rating != null && place.userRatingsTotal != null)
                    UserRatingAndTotalRatingWidget(
                        place: place,
                        userRatingTotal: userRatingTotal,
                        transformedUserRatingTotal: transformedUserRatingTotal)
                  else
                    const Row(
                      children: [Text('No Rating Available')],
                    ),
                  if (place.types.isNotEmpty)
                    SizedBox(
                      height: 35,
                      width: 180,
                      child: Wrap(
                        clipBehavior: Clip.antiAlias,
                        children: [
                          ...List.generate(place.types.length, (index) {
                            if (index < place.types.length - 1) {
                              type =
                                  "${place.types[index].toString()[0].toUpperCase()}${place.types[index].toString().substring(1)}, ";
                              type = swapUnderScoreWithSpace(type);
                            } else {
                              type =
                                  "${place.types.last.toString()[0].toUpperCase()}${place.types.last.toString().substring(1)}";
                              type = swapUnderScoreWithSpace(type);
                            }
                            return Text(
                              type,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            );
                          }),
                        ],
                      ),
                    ),
                  DistanceLabelWidget(
                    fontSize: 12,
                    distance: distance,
                    color: const Color(0xff292f32),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
