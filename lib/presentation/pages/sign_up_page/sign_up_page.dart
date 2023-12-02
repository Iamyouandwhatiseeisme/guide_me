// import 'package:flutter/material.dart';

// import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({
//     super.key,
//   });

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   @override
//   Widget build(BuildContext context) {
//     // return StreamBuilder<User?>(
//     //   stream: FirebaseAuth.instance.authStateChanges(),
//     //   builder: (context, snapshot) {
//     //     //takes user to email verification page
//     //     if (snapshot.connectionState == ConnectionState.waiting) {
//     //       return const LoadingAnimationScaffold();
//     //     } else if (snapshot.hasData) {
//     //       print(snapshot.data);
//     //       return BlocProvider(
//     //         create: (context) => CheckEmailVerificationCubit(),
//     //         child: const VerifyEmailPage(),
//     //       );
//     //     } else if (snapshot.hasError) {
//     //       return const Center(child: Text('Something Went Wrong'));
//     //     } else {
//     //       print(snapshot.data);
//     //       return SignUpPageWidgets(
//     //           emailController: widget.emailController,
//     //           passwordController: widget.passwordController,
//     //           onClickedLogIn: widget.onClickedLogIn);
//     //     }
//     //   },
//     // );
//     return SignUpPageWidgets();
//   }
// }
