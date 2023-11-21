import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guide_me/data/data.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../business_layer/cubit/bottom_navigation_bar_cubit.dart';

class ProfilePageAppbar extends StatelessWidget {
  const ProfilePageAppbar({
    super.key,
    required this.bottomNavigationCubit,
  });

  final BottomNavigationBarCubit bottomNavigationCubit;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          bottomNavigationCubit.changeTab(0);

          Navigator.of(context).pop();
        },
      ),
      title: Text(AppLocalizations.of(context)!.profilePage),
      centerTitle: true,
      actions: [
        TextButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInprovider>(context, listen: false);

              provider.logout();
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, 'authPage');
              Navigator.popUntil(context, ModalRoute.withName('authPage'));
            },
            child: Text(
              AppLocalizations.of(context)!.logout,
              style: const TextStyle(color: Colors.blue),
            ))
      ],
    );
  }
}
