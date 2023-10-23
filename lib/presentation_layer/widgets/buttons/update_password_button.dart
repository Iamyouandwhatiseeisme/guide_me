import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


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
    return ElevatedButton(
        onPressed: () async {
          var cred = EmailAuthProvider.credential(
              email: currentUser.email!, password: passedController.text);
          try {
            await currentUser.reauthenticateWithCredential(cred).then((value) {
              currentUser.updatePassword(passedControllerForNewPassword.text);
            });
          } on FirebaseAuthException catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(e.message!)));
            }
            throw e.message.toString();
          }
          updateUI;
          passedController.clear();
          passedControllerForNewPassword.clear();
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Password changed')));
            Navigator.pop(context);
          }
        },
        child: const Text("Update password"));
  }
}
