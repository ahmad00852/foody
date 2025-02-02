part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState{}

class SignInSuccess extends SignInState{}

class SignInFailed extends SignInState{}
