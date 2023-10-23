import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../presentation_layer/widgets/presentation_layer_widgets.dart';

Future<dynamic> textFieldForNewPassword(
    bool hideText,
    TextEditingController passedController,
    TextEditingController passedControllerForNewPassword,
    Function showPassword,
    BuildContext context,
    User user,
    Function updateUI) {
  var auth = FirebaseAuth.instance;
  var currentUser = auth.currentUser;
  return showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Dialog(
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Change password ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    PasswordTextFormFieldForChangePasswordPage(
                      setState: setState,
                      controller: passedController,
                      updateUI: updateUI,
                      showPassword: showPassword,
                      label: 'Enter your old password',
                      hideText: hideText,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordTextFormFieldForChangePasswordPage(
                        setState: setState,
                        controller: passedControllerForNewPassword,
                        label: "Enter your new password",
                        hideText: hideText,
                        updateUI: updateUI,
                        showPassword: () => showPassword()),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: UpdatePasswordButton(
                        currentUser: currentUser!,
                        passedController: passedController,
                        passedControllerForNewPassword:
                            passedControllerForNewPassword,
                        updateUI: updateUI,
                      ),
                    )
                  ],
                ),
              ),
            );
          }));
}
