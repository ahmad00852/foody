part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

class SignIn extends SignInEvent{
final String email;
final String password;
final context;
  SignIn({required this.email, required this.password,required this.context});
}
