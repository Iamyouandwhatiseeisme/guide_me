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
    listener = st.listen((fireBaseuser) {
      if (fireBaseuser!.email == null) {
        emit(AuthStreamNoUser());
      } else if (fireBaseuser.email != null) {
        print('user not null');
        emit(AuthStreamNotVerified());
      } else if (fireBaseuser.emailVerified) {
        emit(AuthStreamVerified(fireBaseuser));
      } else {
        print('state not cought');
      }

      // }
    });
  }

  @override
  Future<void> close() {
    listener?.cancel();

    return super.close();
  }
}
