// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubit/favorites_button_cubit.dart';

import 'package:guide_me/business_layer/cubits.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../widgets/custom_bottom_navigatio_bar_widget.dart';

class BookmarksPage extends StatelessWidget {
  final String? apiKey;
  final CustomBottomNavigationBar customBottomAppBar;
  const BookmarksPage({
    Key? key,
    this.apiKey,
    required this.customBottomAppBar,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookmarksTabCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Bookmarks',
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
                color: Color(0xffF3F0E6)),
          ),
          iconTheme: const IconThemeData(color: Color(0xffF3F0E6)),
          backgroundColor: const Color(0xff292F32),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BookmarksPageTabOptionsButtons(),
            BlocBuilder<FavoritesCubit, List<FavoriteItem>>(
              builder: (context, state) {
                final List<FavoriteItem> favoritesList = state;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: favoritesList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                      ),
                      child: SizedBox(
                        height: 280,
                        width: 250,
                        child: GestureDetector(
                          onTap: () => Navigator.pushNamed(
                            context,
                            'placePage',
                            arguments: [apiKey, favoritesList[index].item],
                          ),
                          child: SightseeingsPlaceCard(
                            apiKey: apiKey!,
                            distance: favoritesList[index].distance,
                            place: favoritesList[index].item,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
