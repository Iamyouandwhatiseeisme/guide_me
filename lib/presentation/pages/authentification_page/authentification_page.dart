// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubit/auth_stream_cubit.dart';
import 'package:guide_me/bloc/cubit/check_email_verification_cubit.dart';
import 'package:guide_me/presentation/pages/pages.dart';

import 'package:guide_me/presentation/widgets/navigation/navigator_client.dart';

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
          body: BlocConsumer<AuthStreamCubit, AuthStreamState>(
              builder: (context, state) {
            if (state is AuthStreamNotVerified) {
              return const VerifyEmailPage();
            } else {
              return const SignUpPage();
            }
          }, listener: (context, state) {
            if (state is AuthStreamVerified) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context)
                    .pushReplacementNamed(NavigatorClient.firstPage);
              });
            }
          })),
    );
  }
}
