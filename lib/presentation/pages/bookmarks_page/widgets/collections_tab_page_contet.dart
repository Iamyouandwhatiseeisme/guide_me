import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubits.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/presentation/pages/bookmarks_page/bookmarks_page.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CollectionsTabPageContent extends StatelessWidget {
  const CollectionsTabPageContent({
    super.key,
    required this.isFavorites,
    required this.widget,
    required this.distanceMap,
  });

  final bool isFavorites;
  final BookmarksPage widget;
  final Map<NearbyPlacesModel, double?> distanceMap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ValueListenableBuilder(
            valueListenable:
                Hive.box<CollectionModel>('CollectionLists').listenable(),
            builder: (context, box, child) {
              final box = Hive.box<CollectionModel>("CollectionLists");

              final List<CollectionModel> listToPass =
                  box.toMap().values.toList();
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: listToPass.length,
                    itemBuilder: (context, index) {
                      return BlocProvider(
                          create: (context) => IsExapndedCubit(),
                          child: BlocBuilder<IsExapndedCubit, bool>(
                              builder: (context, state) {
                            return state == false
                                ? CollectionsListForCollectionsPage(
                                    icon: const Icon(Icons.arrow_right_outlined,
                                        size: 40),
                                    index: index,
                                    listOfCollections: listToPass)
                                : Column(
                                    children: [
                                      CollectionsListForCollectionsPage(
                                          color: const Color(0xff292F32)
                                              .withOpacity(0.25),
                                          listOfCollections: listToPass,
                                          index: index,
                                          icon: const Icon(
                                              Icons.arrow_drop_down_outlined,
                                              size: 40)),
                                      Builder(builder: (context) {
                                        return listToPass[index]
                                                .items
                                                .isNotEmpty
                                            ? ListViewForCollectionsListThatIsExpanded(
                                                index: index,
                                                isFavorites: isFavorites,
                                                listToPass: listToPass,
                                                widget: widget,
                                                box: box,
                                                distanceMap: distanceMap)
                                            : Container();
                                      }),
                                    ],
                                  );
                          }));
                    }),
              );
            }),
      ),
    );
  }
}
