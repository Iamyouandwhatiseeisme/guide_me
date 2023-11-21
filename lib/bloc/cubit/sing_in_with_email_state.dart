part of 'sing_in_with_email_cubit.dart';

sealed class SingInWithEmailState extends Equatable {
  const SingInWithEmailState();

  @override
  List<Object> get props => [];
}

final class SingInWithEmailInitial extends SingInWithEmailState {}

final class SignInWithEmailSuccessfull extends SingInWithEmailState {}

class SignInWithEmailError extends SingInWithEmailState {
  final String errorMessage;

  const SignInWithEmailError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
