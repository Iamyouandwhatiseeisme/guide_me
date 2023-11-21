import 'package:flutter/material.dart';

import 'package:hive/hive.dart';

import '../../../../data/data.dart';

class ListViewBuilderForCollectionsLists extends StatefulWidget {
  const ListViewBuilderForCollectionsLists({
    super.key,
    required this.listOfCollections,
    required this.placeToAdd,
    required this.snackBar,
  });

  final List<CollectionModel> listOfCollections;
  final NearbyPlacesModel placeToAdd;
  final SnackBar snackBar;

  @override
  State<ListViewBuilderForCollectionsLists> createState() =>
      _ListViewBuilderForCollectionsListsState();
}

class _ListViewBuilderForCollectionsListsState
    extends State<ListViewBuilderForCollectionsLists> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.only(left: 21.0, right: 29, top: 60),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: widget.listOfCollections.length,
            itemBuilder: (context, index) {
              return Dismissible(
                onDismissed: (DismissDirection direction) {
                  setState(() {
                    Hive.box<CollectionModel>('CollectionLists')
                        .delete(widget.listOfCollections[index].name);
                  });
                },
                key: UniqueKey(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.listOfCollections[index].name,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 0.15,
                                  color: Color(0xffF3F0E6)),
                            ),
                            Text(
                              '${widget.listOfCollections[index].items.length} Items',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.15,
                                  color: Color(0xffF3F0E6)),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            if (!widget.listOfCollections[index].items
                                .contains(widget.placeToAdd)) {
                              widget.listOfCollections[index].items
                                  .add(widget.placeToAdd);

                              Hive.box<CollectionModel>("CollectionLists").put(
                                  widget.listOfCollections[index].name,
                                  CollectionModel(
                                      name:
                                          widget.listOfCollections[index].name,
                                      items: widget
                                          .listOfCollections[index].items));
                            } else {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(widget.snackBar);
                            }
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 0.5,
                      decoration: BoxDecoration(
                          color: const Color(0xffF3F0E6).withOpacity(0.25)),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
