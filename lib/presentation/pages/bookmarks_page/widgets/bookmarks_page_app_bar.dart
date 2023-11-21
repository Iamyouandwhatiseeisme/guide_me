import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guide_me/bloc/cubits.dart';

class BookmarkPageAppbar extends StatelessWidget {
  const BookmarkPageAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bottomNavigationCubit =
        BlocProvider.of<BottomNavigationBarCubit>(context);
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          bottomNavigationCubit.changeTab(0);

          Navigator.of(context).pop();
        },
      ),
      centerTitle: true,
      title: Text(
        AppLocalizations.of(context)!.bookmarks,
        style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: Color(0xffF3F0E6)),
      ),
      iconTheme: const IconThemeData(color: Color(0xffF3F0E6)),
      backgroundColor: const Color(0xff292F32),
    );
  }
}
