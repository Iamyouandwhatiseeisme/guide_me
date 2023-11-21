import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guide_me/bloc/cubits.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/presentation/pages/first_page/first_page.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({
    super.key,
  });

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPage();
}

class _VerifyEmailPage extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  Timer? timer;
  bool canResendEmail = true;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CheckEmailVerificationCubit>(context)
        .emailVerificationChecker(
            isEmailVerified: isEmailVerified,
            timer: timer,
            isVerified: isVerified,
            context: context,
            canResendEmail: canResendEmail,
            setStateCanResendFalse: setStateCanResendFalse,
            setStateCanResendTrue: setStateCanResendTrue);
  }

  // void _emailVerificationChecker() {
  //   isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

  //   if (!isEmailVerified) {
  //     sendEmailVerification();
  //     timer = Timer.periodic(const Duration(seconds: 3), (timer) {
  //       checkEmailVerified(
  //           isEmailVerified: isEmailVerified,
  //           isVerified: isVerified,
  //           timer: timer);
  //     });
  //   }
  // }

  void isVerified() {
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
  }

  void setStateCanResendTrue() {
    setState(() {
      canResendEmail = true;
    });
  }

  void setStateCanResendFalse() {
    setState(() {
      canResendEmail = false;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CheckEmailVerificationCubit>(context).checkEmailVerified(
        isEmailVerified: isEmailVerified, isVerified: isVerified);
    //checks if email is verified, if verified, takes the user to firstpage, if not,
    // gives user a timer and an option to resend verification
    return isEmailVerified
        ? const FirstPage()
        : Scaffold(
            backgroundColor: const Color(0xffA3C3DB),
            body: Padding(
              padding: const EdgeInsets.all(40),
              child: Stack(children: <Widget>[
                SingleChildScrollView(
                  child: Column(children: <Widget>[
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/GuideMe (1) 3.png',
                        height: 159.3,
                        width: 200,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      translation(context).emailVerificationSent,
                      style: const TextStyle(
                          fontFamily: 'paragraf',
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    //email verification resend button
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {
                          () {
                            canResendEmail
                                ? BlocProvider.of<CheckEmailVerificationCubit>(
                                        context)
                                    .sendEmailVerification(
                                        context: context,
                                        canResendEmail: canResendEmail,
                                        isEmailVerified: isEmailVerified,
                                        setStateCanResendFalse:
                                            setStateCanResendFalse,
                                        setStateCanResendTrue:
                                            setStateCanResendTrue)
                                : null;
                          };
                        },
                        icon: FaIcon(Icons.email_outlined,
                            color: canResendEmail ? Colors.black : Colors.grey),
                        label: Text(
                          translation(context).resendEmail,
                          style: TextStyle(
                              color:
                                  canResendEmail ? Colors.black : Colors.grey),
                        ))
                  ]),
                )
              ]),
            ),
          );
  }
}
