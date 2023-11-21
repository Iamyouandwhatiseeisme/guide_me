import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInprovider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();

    try {
      if (googleUser == null) return;
      _user = googleUser;
      final googleAuth = await googleUser.authentication;

      var googleProvider = GoogleAuthProvider();
      googleProvider.setCustomParameters({'prompt': 'select_account'});
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw (e.toString());
    }
    notifyListeners();
  }

  Future logout() async {
    await googleSignIn.signOut();
    await googleSignIn.disconnect();

    FirebaseAuth.instance.signOut();

    notifyListeners();
  }
}
