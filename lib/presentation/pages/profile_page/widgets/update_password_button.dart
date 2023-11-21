import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guide_me/bloc/cubits.dart';

class UpdatePasswordButton extends StatelessWidget {
  final User currentUser;

  final TextEditingController passedController;
  final TextEditingController passedControllerForNewPassword;
  final Function updateUI;
  const UpdatePasswordButton({
    Key? key,
    required this.currentUser,
    required this.updateUI,
    required this.passedController,
    required this.passedControllerForNewPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdatePasswordCubit(),
      child: Builder(builder: (context) {
        return ElevatedButton(
            onPressed: () {
              BlocProvider.of<UpdatePasswordCubit>(context).updatePassword(
                  passedControllerForNewPassword:
                      passedControllerForNewPassword,
                  updateUI: updateUI,
                  context: context,
                  currentUser: currentUser,
                  passedController: passedController);
            },
            child: Text(
              AppLocalizations.of(context)!.updatePassword,
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ));
      }),
    );
  }
}
