// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubit/auth_stream_cubit.dart';
import 'package:guide_me/bloc/cubit/check_email_verification_cubit.dart';
import 'package:guide_me/presentation/pages/pages.dart';

import 'package:guide_me/presentation/widgets/navigation/navigator_client.dart';

import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({
    super.key,
  });

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckEmailVerificationCubit(),
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          // body: StreamBuilder<User?>(
          //     stream: FirebaseAuth.instance.authStateChanges(),
          //     builder: (context, snapshot) {
          //       print(snapshot.data);
          //       if (snapshot.hasData &&
          //           snapshot.data != null &&
          //           FirebaseAuth.instance.currentUser!.emailVerified == true) {
          //         //checks if there is an authenticated user, if there is, shows first page, else takes user to authentication page
          //         WidgetsBinding.instance.addPostFrameCallback((_) {
          //           Navigator.of(context)
          //               .pushReplacementNamed(NavigatorClient.firstPage);
          //         });

          //         return const LoadingAnimationScaffold();
          //       } else {
          //         return const AuthPageContent();
          //       }
          //     }),
          body: BlocConsumer<AuthStreamCubit, AuthStreamState>(
              builder: (context, state) {
            print(state);
            if (state is AuthStreamNoUser || state is AuthStreamInitial) {
              return const LoginPage();
            } else if (state is AuthStreamNotVerified) {
              print('must push verificaitonn');
              return const VerifyEmailPage();
            } else {
              return const LoadingAnimationScaffold();
            }
          }, listener: (context, state) {
            if (state is AuthStreamVerified) {
              Navigator.pushReplacementNamed(
                  context, NavigatorClient.firstPage);
            }
          })),
    );
  }
}
