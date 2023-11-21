import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckEmailVerificationCubit extends Cubit<bool> {
  CheckEmailVerificationCubit() : super(false);

  void emailVerificationChecker({
    required Function isVerified,
    required bool isEmailVerified,
    required BuildContext context,
    required bool canResendEmail,
    required Function setStateCanResendFalse,
    required Function setStateCanResendTrue,
    Timer? timer,
  }) {
    emit(false);
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendEmailVerification(
        setStateCanResendTrue: setStateCanResendTrue,
        setStateCanResendFalse: setStateCanResendFalse,
        context: context,
        isEmailVerified: isEmailVerified,
        canResendEmail: canResendEmail,
      );
      timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        checkEmailVerified(
            isEmailVerified: isEmailVerified,
            isVerified: isVerified,
            timer: timer);
      });
    }
  }

  void checkEmailVerified(
      {required bool isEmailVerified,
      required Function isVerified,
      Timer? timer}) async {
    await FirebaseAuth.instance.currentUser!.reload();

    if (isEmailVerified) timer?.cancel();
    emit(true);
  }

  sendEmailVerification(
      {required BuildContext context,
      required bool canResendEmail,
      required bool isEmailVerified,
      required Function setStateCanResendFalse,
      required Function setStateCanResendTrue,
      Timer? timer}) async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setStateCanResendFalse();
      await Future.delayed(const Duration(seconds: 50));
      setStateCanResendTrue();
    } on Exception catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
