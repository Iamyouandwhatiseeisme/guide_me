import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guide_me/bloc/cubits.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/presentation/widgets/navigation/navigator_client.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              Navigator.pushNamedAndRemoveUntil(
                  context,
                  NavigatorClient.authPage,
                  ModalRoute.withName(NavigatorClient.authPage));
            },
            child: Text(
              AppLocalizations.of(context)!.logout,
              style: const TextStyle(color: Colors.blue),
            ))
      ],
    );
  }
}
