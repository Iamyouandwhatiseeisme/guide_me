import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guide_me/data_layer/data.dart';

import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class ListViewBuilderForProfilePage extends StatefulWidget {
  final TextEditingController nameController;

  final User user;

  final Function updateUI;

  final TextEditingController passedControllerForOldPassword;

  final TextEditingController passedControllerForNewPassword;

  const ListViewBuilderForProfilePage({
    super.key,
    required this.listOfSettings,
    required this.listofIcons,
    required this.nameController,
    required this.user,
    required this.updateUI,
    required this.passedControllerForOldPassword,
    required this.passedControllerForNewPassword,
  });

  final List<String> listOfSettings;
  final List<FaIcon> listofIcons;

  @override
  State<ListViewBuilderForProfilePage> createState() =>
      _ListViewBuilderForProfilePageState();
}

class _ListViewBuilderForProfilePageState
    extends State<ListViewBuilderForProfilePage> {
  bool hideText = true;
  void showPassword() {
    setState(() {
      hideText = !hideText;
      print(hideText);
    });
  }

  Future changePassword(
      TextEditingController passedControllerForOldPassword,
      TextEditingController passedControllerForNewPassword,
      User user,
      BuildContext context,
      Function updateUI) async {
    passedControllerForOldPassword.clear();
    passedControllerForNewPassword.clear();

    textFieldForNewPassword(context, user, updateUI);
  }

  Future<dynamic> textFieldForNewPassword(
      BuildContext context, User user, Function updateUI) {
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      PasswordTextFormFieldForChangePasswordPage(
                        setState: setState,
                        controller: widget.passedControllerForOldPassword,
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
                          controller: widget.passedControllerForNewPassword,
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
                          passedController:
                              widget.passedControllerForOldPassword,
                          passedControllerForNewPassword:
                              widget.passedControllerForNewPassword,
                          updateUI: updateUI,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.listOfSettings.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (widget.listOfSettings[index].contains('name')) {
                    changeDisplayName(widget.nameController, widget.user,
                        context, widget.updateUI);
                  } else if (widget.listOfSettings[index]
                      .contains('password')) {
                    changePassword(
                        widget.passedControllerForOldPassword,
                        widget.passedControllerForNewPassword,
                        widget.user,
                        context,
                        widget.updateUI);
                  }
                },
                child: SettingsListView(
                  index: index,
                  listofIcons: widget.listofIcons,
                  listOfSettings: widget.listOfSettings,
                ),
              );
            }));
  }
}