// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubit/geolocator_cubit.dart';
import 'package:guide_me/data_layer/provider/google_sign_in.dart';
import 'package:guide_me/data_layer/provider/theme_provider.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:provider/provider.dart';

import '../../../data_layer/models/language_model.dart';

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
        DropdownButton<Language>(
            icon: const Icon(Icons.language),
            items: Language.languageList()
                .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                        value: e,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              e.flag,
                              style: const TextStyle(fontSize: 30),
                            ),
                            Text(e.name)
                          ],
                        )))
                .toList(),
            onChanged: (Language? language) {}),
        IconButton(
          icon: Icon(Icons.brightness_4), // Icon for theme toggle
          onPressed: () {
            context.read<ThemeProvider>().toggleTheme();
          },
        ),
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
