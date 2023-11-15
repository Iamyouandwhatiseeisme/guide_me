import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guide_me/presentation_layer/pages/first_page.dart';

import '../../data_layer/constants/language_constants.dart';

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
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendEmailVerification();
      timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        checkEmailVerified();
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                            canResendEmail ? sendEmailVerification() : null;
                          };
                        },
                        icon: const FaIcon(Icons.email_outlined),
                        label: Text(translation(context).resendEmail))
                  ]),
                )
              ]),
            ),
          );
  }

  sendEmailVerification() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() {
        canResendEmail = false;
      });
      await Future.delayed(const Duration(seconds: 50));
      setState(() {
        canResendEmail = true;
      });
    } on Exception catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  void checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) timer?.cancel();
  }
}
