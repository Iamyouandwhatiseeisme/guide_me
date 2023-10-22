import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guide_me/data_layer/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  const LoggedInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logged In'),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInprovider>(context, listen: false);
                provider.logout();
              },
              child: const Text('Logout'))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Profile',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
