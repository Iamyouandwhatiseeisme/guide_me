import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guide_me/data_layer/data.dart';
import 'package:flutter/rendering.dart';
import '../presentation_layer_widgets.dart';

class CardUiForBookmarksPage extends CardUi {
  final String apiKey;
  const CardUiForBookmarksPage(
      {super.key,
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

    return GestureDetector(
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
            Container(
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
            SizedBox(
              width: 10,
            ),
            Container(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 12),
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
                    Container(
                      height: 42,
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
