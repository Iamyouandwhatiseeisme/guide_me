import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  Future<void> initFirebase() async {
    await Firebase.initializeApp();
  }
}
