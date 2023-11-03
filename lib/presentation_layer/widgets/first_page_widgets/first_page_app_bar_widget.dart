// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubit/geolocator_cubit.dart';
import 'package:guide_me/data_layer/provider/google_sign_in.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:provider/provider.dart';

class FirstPageAppBar extends StatelessWidget {
  final String apiKey;
  const FirstPageAppBar({
    Key? key,
    required this.apiKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      leadingWidth: 250,
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
            child: const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 14, color: Colors.blue),
              ),
            ))
      ],
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: BlocProvider(
          create: (context) => GeolocatorCubit(),
          child: LocationDisplayWidget(
            apiKey: apiKey,
          ),
        ),
      ),
    );
  }
}
