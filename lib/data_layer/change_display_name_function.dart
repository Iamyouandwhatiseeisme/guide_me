import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guide_me/presentation_layer/widgets/profile_page_widgets.dart/change_name_dialog.dart';

Future changeDisplayName(TextEditingController nameController, User user,
    BuildContext context, Function updateUI) async {
  nameController.clear();
  showDialog(
      context: context,
      builder: (context) => DisplayNameDIalog(
            context: context,
            user: user,
            updateUI: updateUI,
            nameController: nameController,
          ));
}
