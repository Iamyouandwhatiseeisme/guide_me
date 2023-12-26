import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/main.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';
import 'package:provider/provider.dart';

import '../../widgets/navigation/navigator_client.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final firebaseService = sl.get<FirebaseService>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffA3C3DB),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Stack(children: <Widget>[
          SingleChildScrollView(
            child: Form(
              key: formKey,
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
                  translation(context).welcomeToGuideMe,
                  style: const TextStyle(
                      fontFamily: 'paragraf',
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  translation(context).chooseYourPrefferedWayOfAuthentication,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'paragraf',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                AuthPageTextField(
                  controller: _emailController,
                  label: translation(context).email,
                  hintText: 'Example@gmail.com',
                ),
                const SizedBox(height: 24),
                AuthPageTextField(
                    controller: _passwordController,
                    label: translation(context).password,
                    hintText: translation(context).enterPassword),
                SignUpWithButton(
                    onPressed: () {
                      firebaseService.signUpWithEmail(
                          formKey: formKey,
                          emailController: _emailController,
                          passwordController: _passwordController);
                      Navigator.pushReplacementNamed(
                          context, NavigatorClient.authPage);
                    },
                    formKey: formKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    text: translation(context).signUpWithMail,
                    icon: const FaIcon(
                      Icons.mail,
                      color: Colors.red,
                    )),
                SignUpWithButton(
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInprovider>(context,
                        listen: false);
                    provider.googleLogin();
                    Navigator.pushReplacementNamed(
                        context, NavigatorClient.authPage);
                  },
                  text: translation(context).signUpWithGoogle,
                  icon: const FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                  ),
                ),
                TextForSignUpOrSignIn(
                    shouldSignUp: false,
                    textToDisplay: translation(context).alreadyHaveAccount,
                    signUpOrSignIn: translation(context).login)
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
