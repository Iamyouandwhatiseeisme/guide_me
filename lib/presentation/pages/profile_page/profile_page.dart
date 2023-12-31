// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:guide_me/data/data.dart';
import 'package:guide_me/main.dart';
import 'package:guide_me/presentation/pages/first_page/widgets/custom_bottom_navigatio_bar_widget.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

import '../../../bloc/cubits.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final passedControllerForNewPassword = TextEditingController();
  final passedControllerForOldPassword = TextEditingController();
  final bottomNavigationBar = sl.get<CustomBottomNavigationBar>();
  User user = FirebaseAuth.instance.currentUser!;
  final List<FaIcon> listofIcons = [
    const FaIcon(FontAwesomeIcons.pen),
    const FaIcon(FontAwesomeIcons.key),
    const FaIcon(Icons.settings)
  ];

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    passedControllerForNewPassword.dispose();
    passedControllerForOldPassword.dispose();
    super.dispose();
  }

  void updateUI() {
    setState(() {
      user = FirebaseAuth.instance.currentUser!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String editName = getLocalizedStringForDynamicBuilder(
        textLabel: 'editName', localization: AppLocalizations.of(context)!);
    final String changePassword = getLocalizedStringForDynamicBuilder(
        textLabel: 'changePassword',
        localization: AppLocalizations.of(context)!);
    final String settings = getLocalizedStringForDynamicBuilder(
        textLabel: 'settings', localization: AppLocalizations.of(context)!);
    final List<String> listOfSettings = [editName, changePassword, settings];

    final bottomNavigationCubit =
        BlocProvider.of<BottomNavigationBarCubit>(context);
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: ProfilePageAppbar(bottomNavigationCubit: bottomNavigationCubit),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => ChangeNameCubit(),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(32)),
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.profileInformation,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              ProfileInfo(user: user),
              ListViewBuilderForProfilePage(
                listOfSettings: listOfSettings,
                listofIcons: listofIcons,
                nameController: nameController,
                user: user,
                updateUI: updateUI,
                passedControllerForOldPassword: passedControllerForOldPassword,
                passedControllerForNewPassword: passedControllerForNewPassword,
              ),
              Divider(
                color: Colors.grey.withOpacity(0.5),
                height: 1,
              ),
              const SizedBox(
                height: 8,
              ),
              //
            ]),
          ),
        ),
      ),
    );
  }
}
