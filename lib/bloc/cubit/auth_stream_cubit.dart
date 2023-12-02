import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import 'package:firebase_auth/firebase_auth.dart';

part 'auth_stream_state.dart';

class AuthStreamCubit extends Cubit<AuthStreamState> {
  AuthStreamCubit() : super(AuthStreamInitial());

  final Stream<User?> st = FirebaseAuth.instance.authStateChanges();

  late StreamSubscription<dynamic>? listener;

  void init() {
    print(st);
    listener = st.listen((fireBaseuser) {
      if (fireBaseuser == null) {
        print('print null');
      }
      ;
      if (!fireBaseuser!.emailVerified) {
        print('needed verification');
      }
      print('print: $fireBaseuser');
      // if (fireBaseuser!.emailVerified) {

      //   emit(verified);

      // }
    });
  }

  @override
  Future<void> close() {
    listener?.cancel();

    return super.close();
  }
}
