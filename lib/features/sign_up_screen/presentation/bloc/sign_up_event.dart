part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}
class SignUp extends SignUpEvent{
  final String email;
  final String password;
  final String name;
  final context;
  SignUp({required this.name, required this.email, required this.password,required this.context});
}
