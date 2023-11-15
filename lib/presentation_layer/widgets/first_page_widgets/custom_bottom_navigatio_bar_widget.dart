// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubit/bottom_navigation_bar_cubit.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List screens = ['firstPage', 'mapsPage', 'bookmarksPage', 'profilePage'];

    final bottomNavigationCubit =
        BlocProvider.of<BottomNavigationBarCubit>(context);
    return BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
      builder: (context, currentIndex) {
        return Theme(
          data: ThemeData(canvasColor: const Color(0xffC75E6B)),
          child: BottomNavigationBar(
              showSelectedLabels: false,
              unselectedItemColor: const Color(0xfff3f0e6).withOpacity(0.5),
              selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
              currentIndex: currentIndex.currentIndex,
              onTap: (index) {
                final String currentPage =
                    ModalRoute.of(context)!.settings.name!;

                bottomNavigationCubit.changeTab(index);

                if (screens[index] == screens[0] &&
                    !currentPage.contains(screens[0])) {
                  Navigator.pop(context);
                } else if (currentPage.contains(screens[0]) &&
                    currentPage != screens[index]) {
                  Navigator.pushNamed(
                    context,
                    screens[index],
                  );
                } else if (!currentPage.contains(screens[0]) &&
                    currentPage != screens[index]) {
                  Navigator.pushReplacementNamed(context, screens[index]);
                }
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.location_pin,
                    ),
                    label: 'Location'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite,
                    ),
                    label: 'Bookmarks'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.account_circle_rounded,
                    ),
                    label: 'Profile'),
              ]),
        );
      },
    );
  }
}