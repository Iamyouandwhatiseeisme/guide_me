part of 'auth_stream_cubit.dart';

sealed class AuthStreamState extends Equatable {
  const AuthStreamState();

  @override
  List<Object> get props => [];
}

final class AuthStreamInitial extends AuthStreamState {}

final class AuthStreamNoUser extends AuthStreamState {}

final class AuthStreamNotVerified extends AuthStreamState {}

final class AuthStreamVerified extends AuthStreamState {
  final User user;

  const AuthStreamVerified(this.user);
  @override
  List<Object> get props => [user];
}
