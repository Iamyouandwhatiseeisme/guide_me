// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

// class LoginPageWidget extends StatefulWidget {
//   const LoginPageWidget({
//     super.key,
//   });

//   @override
//   State<LoginPageWidget> createState() => _LoginPageWidgetState();
// }

// class _LoginPageWidgetState extends State<LoginPageWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).primaryColor,
//       body: StreamBuilder<User?>(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData && snapshot.data != null) {
//               WidgetsBinding.instance.addPostFrameCallback((_) {
//                 Navigator.of(context).pushReplacementNamed('firstPage');
//               });

//               return const LoadingAnimationScaffold();
//             } else {
//               return const AuthPageWidget();
//             }
//           }),
//     );
//   }
// }
