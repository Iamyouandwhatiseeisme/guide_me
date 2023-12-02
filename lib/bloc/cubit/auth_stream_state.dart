part of 'auth_stream_cubit.dart';

sealed class AuthStreamState extends Equatable {
  const AuthStreamState();

  @override
  List<Object> get props => [];
}

final class AuthStreamInitial extends AuthStreamState {}
