import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'sing_in_with_email_state.dart';

class SingInWithEmailCubit extends Cubit<SingInWithEmailState> {
  SingInWithEmailCubit() : super(SingInWithEmailInitial());

  Future<void> signInWithEmail(
      {required BuildContext context,
      required GlobalKey<FormState> formKey,
      required TextEditingController emailController,
      required TextEditingController passwordController}) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    emit(SingInWithEmailInitial());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      emit(SignInWithEmailSuccessfull());
    } on FirebaseAuthException catch (e) {
      emit(SignInWithEmailError(e.message!));
    }
  }
}
