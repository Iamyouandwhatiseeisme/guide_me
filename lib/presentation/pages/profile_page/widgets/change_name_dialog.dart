import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guide_me/bloc/cubits.dart';

class DisplayNameDIalog extends StatelessWidget {
  final User user;
  final BuildContext context;
  final Function updateUI;
  final TextEditingController nameController;
  const DisplayNameDIalog({
    super.key,
    required this.user,
    required this.context,
    required this.updateUI,
    required this.nameController,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 140,
        width: double.infinity,
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.enterYourName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (name) => name == null
                  ? AppLocalizations.of(context)!.nameExample
                  : null,
              onEditingComplete: () async {
                await user.updateDisplayName(nameController.text);
                print('print: should update');
                updateUI();
                nameController.clear();
                if (context.mounted) Navigator.of(context).pop();
              },
              onChanged: (text) {
                updateUI();
              },
              controller: nameController,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                    fontFamily: 'Telegraf',
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff292F32).withOpacity(0.75)),
                hintText: AppLocalizations.of(context)!.nameExample,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(
                        width: 0.5,
                        color: const Color(0xff292F32).withOpacity(0.5))),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(
                        width: 0.5,
                        color: const Color(0xff292F32).withOpacity(0.5))),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(
                        width: 0.5,
                        color: const Color(0xff292F32).withOpacity(0.5))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(
                        width: 0.5,
                        color: const Color(0xff292F32).withOpacity(0.5))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
