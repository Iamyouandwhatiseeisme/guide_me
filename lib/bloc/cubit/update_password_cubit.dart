import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit() : super(UpdatePasswordInitial());
  Future<void> updatePassword({
    required TextEditingController passedControllerForNewPassword,
    required Function updateUI,
    required BuildContext context,
    required User currentUser,
    required TextEditingController passedController,
  }) async {
    emit(UpdatePasswordInitial());
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
      emit(UpdatePasswordError(e.message!));
      throw e.message.toString();
    }
    updateUI;
    passedController.clear();
    passedControllerForNewPassword.clear();
    if (context.mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Password changed')));
      emit(UpdatePasswordSuccess());
      Navigator.pop(context);
    }
  }
}
